resource "azurerm_nat_gateway" "nat-gateway" {
  name                    = var.name
  location                = var.location
  resource_group_name     = var.resource_group
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  sku_name                = var.sku
  zones                   = var.zones
  tags                    = var.tags
}