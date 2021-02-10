module "azurekeyvault" {
  source                  = "git@github.com:hmcts/cnp-module-key-vault?ref=master"
  name                    = "sds${var.product}-${var.environment}"
  product                 = "${var.product}"
  env                     = "${var.environment}"
  tenant_id               = data.azurerm_client_config.current.tenant_id
  object_id               = azurerm_user_assigned_identity.managed_identity.principal_id
  resource_group_name     = azurerm_resource_group.rg.name
  product_group_object_id = "253a03f0-6310-40d2-a286-1de6ac85f052" // DTS platform operations team 
}