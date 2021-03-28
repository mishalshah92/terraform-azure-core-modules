output "id" {
  value = azurerm_function_app.function.id
}

output "outbound_ip_addresses" {
  value = azurerm_function_app.function.outbound_ip_addresses
}

output "possible_outbound_ip_addresses" {
  value = azurerm_function_app.function.possible_outbound_ip_addresses
}

output "default_hostname" {
  value = azurerm_function_app.function.default_hostname
}

output "identity" {
  value = azurerm_function_app.function.identity
}

output "site_credential" {
  value = azurerm_function_app.function.site_credential
}

output "kind" {
  value = azurerm_function_app.function.kind
}