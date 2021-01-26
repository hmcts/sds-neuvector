data "azurerm_client_config" "current" {
}

data "azurerm_key_vault" "genesis-kv" {
  name                = "dtssharedservices${var.environment}kv"
  resource_group_name = "genesis-rg"
}

