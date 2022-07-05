module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.environment
  product     = var.product
  builtFrom   = var.builtFrom
}

resource "azurerm_resource_group" "rg" {
  name     = "sds-${var.product}-${var.environment}-rg"
  location = var.location
  tags     = module.ctags.common_tags
}
resource "azurerm_storage_account" "stg" {
  name                     = "sds${var.product}${var.environment}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = local.storage_account_repl_type

  tags = module.ctags.common_tags
}

resource "azurerm_storage_share" "share" {
  count = 2

  name                 = "neuvector-data-${format("%02s", count.index)}"
  storage_account_name = azurerm_storage_account.stg.name
  quota                = 1
}


resource "azurerm_key_vault_secret" "kvs" {
  name         = "storage-account-key"
  value        = azurerm_storage_account.stg.primary_access_key
  key_vault_id = module.azurekeyvault.key_vault_id
}
