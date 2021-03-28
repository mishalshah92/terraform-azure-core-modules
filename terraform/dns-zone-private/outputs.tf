output "id" {
  value = azurerm_private_dns_zone.private_dns_zone.id
}

output "number_of_record_sets" {
  value = azurerm_private_dns_zone.private_dns_zone.number_of_record_sets
}

output "max_number_of_record_sets" {
  value = azurerm_private_dns_zone.private_dns_zone.max_number_of_record_sets
}

output "max_number_of_virtual_network_links" {
  value = azurerm_private_dns_zone.private_dns_zone.max_number_of_virtual_network_links
}

output "max_number_of_virtual_network_links_with_registration" {
  value = azurerm_private_dns_zone.private_dns_zone.max_number_of_virtual_network_links_with_registration
}