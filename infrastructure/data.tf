data "azurerm_client_config" "current" {
}

data "azurerm_key_vault" "core-kv" {
  name                = var.keyvault_name
  resource_group_name = var.keyvault_rg
}

