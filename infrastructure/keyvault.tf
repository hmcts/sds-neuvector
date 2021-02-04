resource "azurerm_key_vault" "kv" {
  name                       = "sds${var.product}-${var.environment}"
  location                   = var.location
  resource_group_name        = azurerm_resource_group.rg.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 7
  purge_protection_enabled   = true
  tags                       = local.common_tags
  sku_name                   = "standard"

  access_policy {
    object_id = azurerm_user_assigned_identity.managed_identity.principal_id
    tenant_id = data.azurerm_client_config.current.tenant_id
    key_permissions = [
      "get",
      "list",
    ]

    secret_permissions = [
      "get",
      "list",
    ]

    storage_permissions = [
      "get",
      "list",
    ]
  }
}