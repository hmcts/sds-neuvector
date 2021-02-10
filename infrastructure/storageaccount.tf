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
  account_replication_type = "LRS"

  tags = local.common_tags
}

resource "azurerm_storage_share" "share" {
  name                 = "neuvector-data-00"
  storage_account_name = azurerm_storage_account.stg.name
  quota                = 1
}


resource "azurerm_key_vault_secret" "kvs" {
  name         = "storage-account-key"
  value        = azurerm_storage_account.stg.primary_access_key
  key_vault_id = module.azurekeyvault.id
}
