resource "azurerm_public_ip" "net-gateway-ip" {
  name                = "${var.name}-vnet-gateway-ip"
  location            = var.location
  resource_group_name = var.resource_group

  allocation_method       = var.ip_allocation_method
  idle_timeout_in_minutes = var.ip_idle_timeout_in_minutes
  ip_version              = "IPv4"

  tags = var.tags
}