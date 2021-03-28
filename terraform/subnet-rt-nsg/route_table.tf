resource "azurerm_route_table" "rt" {
  name                          = var.rt_name == null ? "${var.name}-rt" : var.rt_name
  location                      = var.location
  resource_group_name           = var.resource_group
  disable_bgp_route_propagation = var.disable_bgp_route_propagation

  tags = local.tags
}

resource "azurerm_route" "routes" {

  for_each = var.rt_routes

  name                = each.key
  resource_group_name = var.resource_group
  route_table_name    = azurerm_route_table.rt.name
  address_prefix      = each.value.address_prefix
  next_hop_type       = each.value.next_hop_type

  depends_on = [
    azurerm_route_table.rt
  ]
}