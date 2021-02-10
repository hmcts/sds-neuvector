module "azurekeyvault" {
  source                      = "git::https://github.com/hmcts/cnp-module-key-vault?ref=master"
  name                        = "sds${var.product}-${var.environment}"
  product                     = "${var.product}"
  env                         = "${var.environment}"
  managed_identity_object_ids = [azurerm_user_assigned_identity.managed_identity.principal_id]
  resource_group_name         = azurerm_resource_group.rg.name
  product_group_name          = "DTS Platform Operations"
  common_tags                 = var.common_tags
}