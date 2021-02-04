resource "azurerm_user_assigned_identity" "managed_identity" {
  resource_group_name = "managed-identities-${var.environment}-rg"
  location            = var.location

  name = "${var.product}-${var.environment}-mi"

  tags = local.common_tags
}