output "id" {
  value = azurerm_application_gateway.app_gateway.id
}

output "authentication_certificate" {
  value = azurerm_application_gateway.app_gateway.authentication_certificate
}

output "backend_address_pool" {
  value = azurerm_application_gateway.app_gateway.backend_address_pool
}

output "backend_http_settings" {
  value = azurerm_application_gateway.app_gateway.backend_http_settings
}

output "frontend_ip_configuration" {
  value = azurerm_application_gateway.app_gateway.frontend_ip_configuration
}

output "frontend_port" {
  value = azurerm_application_gateway.app_gateway.frontend_port
}

output "gateway_ip_configuration" {
  value = azurerm_application_gateway.app_gateway.gateway_ip_configuration
}

output "enable_http2" {
  value = azurerm_application_gateway.app_gateway.enable_http2
}

output "http_listener" {
  value = azurerm_application_gateway.app_gateway.http_listener
}

output "probe" {
  value = azurerm_application_gateway.app_gateway.probe
}

output "request_routing_rule" {
  value = azurerm_application_gateway.app_gateway.request_routing_rule
}

output "ssl_certificate" {
  value = azurerm_application_gateway.app_gateway.ssl_certificate
}

output "url_path_map" {
  value = azurerm_application_gateway.app_gateway.url_path_map
}

output "custom_error_configuration" {
  value = azurerm_application_gateway.app_gateway.custom_error_configuration
}

output "redirect_configuration" {
  value = azurerm_application_gateway.app_gateway.redirect_configuration
}