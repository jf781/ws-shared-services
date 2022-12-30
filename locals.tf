##################
# Local Variables
##################

locals {
  location_prefix_map = {
    "eus2" = "eastus2",
    "cus" = "centralus"
  }
  org_abreviation     = "client"
  prefix              = "${var.tags["Env"]}"
  storageprefix       = "${local.org_abreviation}ss"
  time                = formatdate("DD-MMM-YYYY hh:mm:ss", timeadd(timestamp(), "-6h")) # UTC -6h = CST
  tags                = merge(var.tags, { "ModifiedDate" = local.time })
  vmadminusername     = "vmadminuser"
  vmadminpassname     = "vmadminpassword"
  lock                = false

  sub_diag_categories = [
    "Security",
    "Administrative",
    "ServiceHealth",
    "Alert",
    "Recommendation",
    "Policy",
    "Autoscale",
    "ResourceHealth"
  ]
}