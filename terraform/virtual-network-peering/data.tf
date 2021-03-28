data "azurerm_virtual_network" "virtual_network" {
  name                = var.virtual_network_name
  resource_group_name = var.resource_group
}

data "azurerm_virtual_network" "remote_virtual_network" {
  name                = var.remote_virtual_network_name
  resource_group_name = var.remote_resource_group_name
}