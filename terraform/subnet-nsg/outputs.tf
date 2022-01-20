output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "subnet_name" {
  value = azurerm_subnet.subnet.name
}

output "nsg_id" {
  value = azurerm_network_security_group.net-sg.id
}

output "nsg_name" {
  value = azurerm_network_security_group.net-sg.name
}