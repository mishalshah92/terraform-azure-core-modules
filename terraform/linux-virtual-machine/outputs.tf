output "nat_interface_id" {
  value = azurerm_network_interface.linux_machine_nat_interface.id
}

output "nat_interface_name" {
  value = azurerm_network_interface.linux_machine_nat_interface.name
}

output "nat_interface_mac_address" {
  value = azurerm_network_interface.linux_machine_nat_interface.mac_address
}

output "id" {
  value = azurerm_linux_virtual_machine.linux_machine.id
}

output "private_ip_address" {
  value = azurerm_linux_virtual_machine.linux_machine.private_ip_address
}

output "public_ip_address" {
  value = azurerm_linux_virtual_machine.linux_machine.public_ip_address
}

output "virtual_machine_id" {
  value = azurerm_linux_virtual_machine.linux_machine.virtual_machine_id
}