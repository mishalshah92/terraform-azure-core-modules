output "id" {
  value = azurerm_dns_zone.public_dns_zone.id
}

output "name_servers" {
  value = azurerm_dns_zone.public_dns_zone.name_servers
}

output "max_number_of_record_sets" {
  value = azurerm_dns_zone.public_dns_zone.max_number_of_record_sets
}

output "number_of_record_sets" {
  value = azurerm_dns_zone.public_dns_zone.number_of_record_sets
}