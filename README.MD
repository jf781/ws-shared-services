## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | app.terraform.io/Joe-Demo/module-key-vault/azurerm | n/a |
| <a name="module_resource_group_automation"></a> [resource\_group\_automation](#module\_resource\_group\_automation) | app.terraform.io/Joe-Demo/module-resource-group/azurerm | n/a |
| <a name="module_resource_group_logs"></a> [resource\_group\_logs](#module\_resource\_group\_logs) | app.terraform.io/Joe-Demo/module-resource-group/azurerm | n/a |
| <a name="module_resource_group_mgmt"></a> [resource\_group\_mgmt](#module\_resource\_group\_mgmt) | app.terraform.io/Joe-Demo/module-resource-group/azurerm | n/a |
| <a name="module_resource_group_monitoring"></a> [resource\_group\_monitoring](#module\_resource\_group\_monitoring) | app.terraform.io/Joe-Demo/module-resource-group/azurerm | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_automation_account.automation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/automation_account) | resource |
| [azurerm_log_analytics_workspace.la_workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_monitor_diagnostic_setting.key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_storage_account.storage_act_log](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [random_password.prodPwd](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [azurerm_management_group.mg_root](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/management_group) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dfc_enable_standard_plan"></a> [dfc\_enable\_standard\_plan](#input\_dfc\_enable\_standard\_plan) | n/a | <pre>object({<br>    app_services        = bool<br>    container_registry  = bool<br>    key_vaults          = bool<br>    kubernetes          = bool<br>    azure_sql           = bool<br>    sql_vms             = bool<br>    storage_accounts    = bool<br>    vms                 = bool<br>    arm                 = bool<br>    open_src_dbs        = bool<br>    containers          = bool<br>    dns                 = bool<br>  })</pre> | <pre>{<br>  "app_services": false,<br>  "arm": false,<br>  "azure_sql": false,<br>  "container_registry": false,<br>  "containers": false,<br>  "dns": false,<br>  "key_vaults": false,<br>  "kubernetes": false,<br>  "open_src_dbs": false,<br>  "sql_vms": true,<br>  "storage_accounts": false,<br>  "vms": true<br>}</pre> | no |
| <a name="input_root_management_group"></a> [root\_management\_group](#input\_root\_management\_group) | The root management group to create the child management groups under | `string` | `"Tenant Root Group"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to all resources that are part of the workspace. | `map` | <pre>{<br>  "BusinessUnit": "6030050003-01-059, 6030050003-30-059",<br>  "CreationDate": "7/28/2022",<br>  "Env": "shared-services"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_image_gallery_id"></a> [image\_gallery\_id](#output\_image\_gallery\_id) | n/a |
| <a name="output_image_gallery_name"></a> [image\_gallery\_name](#output\_image\_gallery\_name) | n/a |
| <a name="output_key_vault_name"></a> [key\_vault\_name](#output\_key\_vault\_name) | n/a |
| <a name="output_key_vault_resource_group"></a> [key\_vault\_resource\_group](#output\_key\_vault\_resource\_group) | n/a |
| <a name="output_log_analytics_id"></a> [log\_analytics\_id](#output\_log\_analytics\_id) | n/a |
| <a name="output_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#output\_log\_analytics\_workspace\_id) | n/a |
| <a name="output_log_analytics_workspace_location"></a> [log\_analytics\_workspace\_location](#output\_log\_analytics\_workspace\_location) | n/a |
| <a name="output_resource_group_automation_az1_name"></a> [resource\_group\_automation\_az1\_name](#output\_resource\_group\_automation\_az1\_name) | n/a |
| <a name="output_resource_group_backup_az1_name"></a> [resource\_group\_backup\_az1\_name](#output\_resource\_group\_backup\_az1\_name) | n/a |
| <a name="output_resource_group_backup_az2_name"></a> [resource\_group\_backup\_az2\_name](#output\_resource\_group\_backup\_az2\_name) | n/a |
| <a name="output_resource_group_dns_az1_name"></a> [resource\_group\_dns\_az1\_name](#output\_resource\_group\_dns\_az1\_name) | n/a |
| <a name="output_resource_group_dns_az2_name"></a> [resource\_group\_dns\_az2\_name](#output\_resource\_group\_dns\_az2\_name) | n/a |
| <a name="output_resource_group_logs_az1_name"></a> [resource\_group\_logs\_az1\_name](#output\_resource\_group\_logs\_az1\_name) | n/a |
| <a name="output_resource_group_mgmt_az1_name"></a> [resource\_group\_mgmt\_az1\_name](#output\_resource\_group\_mgmt\_az1\_name) | n/a |
| <a name="output_storage_act_log_blob_endpoint"></a> [storage\_act\_log\_blob\_endpoint](#output\_storage\_act\_log\_blob\_endpoint) | n/a |
| <a name="output_storage_act_log_id"></a> [storage\_act\_log\_id](#output\_storage\_act\_log\_id) | n/a |
| <a name="output_storage_act_log_id_az2"></a> [storage\_act\_log\_id\_az2](#output\_storage\_act\_log\_id\_az2) | n/a |
| <a name="output_storage_act_log_name"></a> [storage\_act\_log\_name](#output\_storage\_act\_log\_name) | n/a |
| <a name="output_storage_act_mgmt_vm_diag_blob_endpoint"></a> [storage\_act\_mgmt\_vm\_diag\_blob\_endpoint](#output\_storage\_act\_mgmt\_vm\_diag\_blob\_endpoint) | n/a |
| <a name="output_storage_act_mgmt_vm_diag_blob_endpoint_az2"></a> [storage\_act\_mgmt\_vm\_diag\_blob\_endpoint\_az2](#output\_storage\_act\_mgmt\_vm\_diag\_blob\_endpoint\_az2) | n/a |
| <a name="output_storage_act_mgmt_vm_diag_id"></a> [storage\_act\_mgmt\_vm\_diag\_id](#output\_storage\_act\_mgmt\_vm\_diag\_id) | n/a |
| <a name="output_storage_act_mgmt_vm_diag_id_az2"></a> [storage\_act\_mgmt\_vm\_diag\_id\_az2](#output\_storage\_act\_mgmt\_vm\_diag\_id\_az2) | n/a |
| <a name="output_storage_act_mgmt_vm_diag_name"></a> [storage\_act\_mgmt\_vm\_diag\_name](#output\_storage\_act\_mgmt\_vm\_diag\_name) | n/a |
| <a name="output_storage_act_mgmt_vm_diag_name_az2"></a> [storage\_act\_mgmt\_vm\_diag\_name\_az2](#output\_storage\_act\_mgmt\_vm\_diag\_name\_az2) | n/a |
