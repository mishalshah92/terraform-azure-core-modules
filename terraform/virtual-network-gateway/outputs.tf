output "ip_address" {
  value = azurerm_public_ip.net-gateway-ip.ip_address
}

output "ip_version" {
  value = azurerm_public_ip.net-gateway-ip.ip_version
}

output "ip_zones" {
  value = azurerm_public_ip.net-gateway-ip.zones
}

output "id" {
  value = azurerm_virtual_network_gateway.network_gateway.id
}