resource "azurerm_resource_group" "rg" {
  name     = "sds-${var.product}-${var.environment}-rg"
  location = var.location
  tags     = local.common_tags
}
resource "azurerm_storage_account" "stg" {
  name                     = "sds${var.product}${var.environment}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = local.storage_account_repl_type

  tags = local.common_tags
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
