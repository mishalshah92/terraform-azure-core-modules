resource "azurerm_virtual_network_peering" "peering" {

  name                = var.name
  resource_group_name = var.resource_group

  virtual_network_name         = data.azurerm_virtual_network.virtual_network.name
  remote_virtual_network_id    = data.azurerm_virtual_network.remote_virtual_network.id
  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic
  allow_gateway_transit        = var.allow_gateway_transit
  use_remote_gateways          = var.use_remote_gateways
}
