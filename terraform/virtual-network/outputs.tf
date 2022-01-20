output "name" {
  value = azurerm_virtual_network.vnet.name
}

output "resource_group_name" {
  value = azurerm_virtual_network.vnet.resource_group_name
}

output "id" {
  value = azurerm_virtual_network.vnet.id
}

output "guid" {
  value = azurerm_virtual_network.vnet.guid
}

output "location" {
  value = azurerm_virtual_network.vnet.location
}

output "subnets" {
  value = azurerm_virtual_network.vnet.subnet
}