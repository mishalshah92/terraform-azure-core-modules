resource "azurerm_network_security_group" "net-sg" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group

  tags = var.tags
}