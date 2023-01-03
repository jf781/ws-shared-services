#---------------------------------------------------------------
# Unmanaged Resources
#---------------------------------------------------------------

# Get data for subscription that is being worked in
data "azurerm_subscription" "current" {
}

# Get data for the root group to add service principal's RBAC
data "azurerm_management_group" "mg_root" {
  name = var.root_mgmt_group
}

#---------------------------------------------------------------
# Managed Resources
#---------------------------------------------------------------

# Create resource groups to be used within the platform subscription
module "resource_group_monitoring" {
    source              = "app.terraform.io/Joe-Demo/module-resource-group/azurerm"
    prefix              = "rg-${local.prefix}"
    resource_group_name = "monitoring-001"
    location            = "${lookup(local.location_prefix_map, "cus")}"
    lock                = local.lock
    tags                = merge(local.tags, { "Region" = lookup(local.location_prefix_map, "cus") })
}

module "resource_group_automation" {
    source              = "app.terraform.io/Joe-Demo/module-resource-group/azurerm"
    prefix              = "rg-${local.prefix}"
    resource_group_name = "automation-001"
    location            = "${lookup(local.location_prefix_map, "cus")}"
    lock                = local.lock
    tags                = merge(local.tags, { "Region" = lookup(local.location_prefix_map, "cus") })
}

module "resource_group_logs" {
    source              = "app.terraform.io/Joe-Demo/module-resource-group/azurerm"
    prefix              = "rg-${local.prefix}"
    resource_group_name = "logging-001"
    location            = "${lookup(local.location_prefix_map, "cus")}"
    lock                = local.lock
    tags                = merge(local.tags, { "Region" = lookup(local.location_prefix_map, "cus") })
}

module "resource_group_mgmt" {
    source              = "app.terraform.io/Joe-Demo/module-resource-group/azurerm"
    prefix              = "rg-${local.prefix}"
    resource_group_name = "mgmt-001"
    location            = "${lookup(local.location_prefix_map, "cus")}"
    lock                = local.lock
    tags                = merge(local.tags, { "Region" = lookup(local.location_prefix_map, "cus") })
}

# Create a storage account to be used for log storage in conjuntion with the log analytics workspace
resource "azurerm_storage_account" "storage_act_log" {
  name                            = "stg${local.storageprefix}stlogs001"
  resource_group_name             = module.resource_group_logs.resource_group_name
  location                        = "${lookup(local.location_prefix_map, "cus")}"
  account_tier                    = "Standard"
  account_replication_type        = "GRS"
  account_kind                    = "StorageV2"
  enable_https_traffic_only       = "true"
  allow_nested_items_to_be_public = "false"
  tags                            = merge(local.tags, { "Region" = lookup(local.location_prefix_map, "cus") })

  network_rules {
    default_action        = "Deny"
    bypass                = [ "AzureServices" ]
  }
}

# Create automation account to be used for any shared services automated processes
resource "azurerm_automation_account" "automation" {
  name                = "aa-${local.prefix}-aa-management"
  location            = "${lookup(local.location_prefix_map, "cus")}"
  resource_group_name = module.resource_group_automation.resource_group_name
  sku_name            = "Basic"
  tags = merge(local.tags, { "Region" = lookup(local.location_prefix_map, "cus") })
  identity {
    type = "SystemAssigned"
  }
}


# Create a log analytics workspace to storage log datra from various sources through the Azure tenant
resource "azurerm_log_analytics_workspace" "la_workspace" {
  name                = "laws-${local.org_abreviation}-${local.prefix}-log-monitor-001"
  location            = "${lookup(local.location_prefix_map, "cus")}"
  resource_group_name = module.resource_group_logs.resource_group_name
  sku                 = "PerGB2018"
  tags                = merge(local.tags, { "Region" = lookup(local.location_prefix_map, "cus") })
}

# Generate random 16 character password
resource "random_password" "prodPwd" {
  length=16
  special = true
}

# Create key vault and add secrets for the vm admin username and password
module "key_vault" {
    source              = "app.terraform.io/Joe-Demo/module-key-vault/azurerm"
    location            = "${lookup(local.location_prefix_map, "cus")}"
    tags                = merge(local.tags, { "Region" = lookup(local.location_prefix_map, "cus") })
    key_vault = {
      name                        = "kv-ss-mgmt-001"
      resource_group_name         = module.resource_group_mgmt.resource_group_name
      purge_protection_enabled    = true 
      secrets_owners              = var.key_vault_secret_owner_group
    }
    key_vault_secrets = [
      {
        secret_name = local.vmadminusername
        secret_value  = "berlinadmin"
      },
      {
        secret_name = local.vmadminpassname
        secret_value  = random_password.prodPwd.result
      }
    ]
    # lifecycle {
    #   ignore_changes = [
    #     key_vault_secrets,
    #   ]
    # }
}

resource "azurerm_monitor_diagnostic_setting" "key_vault" {
  name                        = "diag-${local.prefix}-kv-ss-mgmt-001-diag-settings"
  target_resource_id          = module.key_vault.id
  storage_account_id          = azurerm_storage_account.storage_act_log.id
  log_analytics_workspace_id  = azurerm_log_analytics_workspace.la_workspace.id

  log {
    category_group = "allLogs"
    enabled  = true

    retention_policy {
      enabled = true
      days    = "365"
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = true
      days    = "365"
    }
  }
}