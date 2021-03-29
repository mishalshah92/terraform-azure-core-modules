resource "azurerm_route_table" "rt" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group
  disable_bgp_route_propagation = var.disable_bgp_route_propagation

  dynamic "route" {
    for_each = length(var.routes) > 0 ? var.routes : []
    content {
      name           = route.value["name"]
      address_prefix = route.value["address_prefix"]
      next_hop_type  = route.value["next_hop_type"]
    }
  }

  tags = local.tags
}