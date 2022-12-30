#---------------------------------------------------------------
# Variables for unmanaged resources
#---------------------------------------------------------------

variable "root_management_group" {
  description = "The root management group to create the child management groups under"
  type        = string
  default     = "Tenant Root Group"
}


variable "tags" {
  description = "Tags to be applied to all resources that are part of the workspace."
  type = map
  default = {
    "BusinessUnit"            = "6030050003-01-059, 6030050003-30-059"
    "CreationDate"            = "7/28/2022"
    "Env"                     = "shared-services"
  }
}

variable "dfc_enable_standard_plan" {
  type = object({
    app_services        = bool
    container_registry  = bool
    key_vaults          = bool
    kubernetes          = bool
    azure_sql           = bool
    sql_vms             = bool
    storage_accounts    = bool
    vms                 = bool
    arm                 = bool
    open_src_dbs        = bool
    containers          = bool
    dns                 = bool
  })
  default = {
    app_services        = false
    container_registry  = false
    key_vaults          = false
    kubernetes          = false
    azure_sql           = false
    sql_vms             = true
    storage_accounts    = false
    vms                 = true
    arm                 = false
    open_src_dbs        = false
    containers          = false
    dns                 = false
  }
}