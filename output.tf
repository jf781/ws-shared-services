output "resource_group_automation_az1_name" {
  value = module.resource_group_automation_az1.resource_group_name
}

output "resource_group_logs_az1_name" {
  value = module.resource_group_logs_az1.resource_group_name
}

output "resource_group_backup_az1_name" {
  value = module.resource_group_backup_az1.resource_group_name
}

output "resource_group_backup_az2_name" {
  value = module.resource_group_backup_az2.resource_group_name
}

output "resource_group_mgmt_az1_name" {
  value = module.resource_group_mgmt_az1.resource_group_name
}

output "resource_group_dns_az1_name" {
  value = module.resource_group_dns_az1.resource_group_name
}

output "resource_group_dns_az2_name" {
  value = module.resource_group_dns_az2.resource_group_name
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.la_workspace.workspace_id
}

output "log_analytics_workspace_location" {
  value = azurerm_log_analytics_workspace.la_workspace.location
}

output "log_analytics_id" {
  value = azurerm_log_analytics_workspace.la_workspace.id
}

output "storage_act_log_id" {
  value = azurerm_storage_account.storage_act_log.id
}

output "storage_act_log_id_az2" {
  value = azurerm_storage_account.storage_act_log_az2.id
}

output "storage_act_log_name" {
  value = azurerm_storage_account.storage_act_log.name
}

output "storage_act_log_blob_endpoint" {
  value = azurerm_storage_account.storage_act_log.primary_blob_endpoint
}

output "storage_act_mgmt_vm_diag_id" {
  value = azurerm_storage_account.storage_act_mgmt_vm_diag.id
}

output "storage_act_mgmt_vm_diag_name" {
  value = azurerm_storage_account.storage_act_mgmt_vm_diag.name
}

output "storage_act_mgmt_vm_diag_blob_endpoint" {
  value = azurerm_storage_account.storage_act_mgmt_vm_diag.primary_blob_endpoint
}

output "storage_act_mgmt_vm_diag_id_az2" {
  value = azurerm_storage_account.storage_act_mgmt_vm_diag_az2.id
}

output "storage_act_mgmt_vm_diag_name_az2" {
  value = azurerm_storage_account.storage_act_mgmt_vm_diag_az2.name
}

output "storage_act_mgmt_vm_diag_blob_endpoint_az2" {
  value = azurerm_storage_account.storage_act_mgmt_vm_diag_az2.primary_blob_endpoint
}

output "key_vault_name" {
  value = module.key_vault.name
}

output "key_vault_resource_group" {
  value = module.key_vault.resource_group_name
}

output "image_gallery_id" {
  value = azurerm_shared_image_gallery.gallery.id
}

output "image_gallery_name" {
  value = azurerm_shared_image_gallery.gallery.unique_name
}