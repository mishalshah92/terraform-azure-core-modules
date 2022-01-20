resource "azurerm_subnet" "subnet" {
  name                                           = var.name
  resource_group_name                            = var.resource_group
  virtual_network_name                           = var.virtual_network_name
  address_prefixes                               = var.address_prefixes
  service_endpoints                              = var.service_endpoints
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
  enforce_private_link_service_network_policies  = var.enforce_private_link_service_network_policies
}

resource "azurerm_subnet_route_table_association" "subnet_rt_association" {
  subnet_id      = azurerm_subnet.subnet.id
  route_table_id = azurerm_route_table.rt.id
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.net-sg.id
}