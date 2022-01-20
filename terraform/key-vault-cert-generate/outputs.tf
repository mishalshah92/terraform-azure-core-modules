output "id" {
  value = azurerm_key_vault_certificate.key_vault_certificate.id
}

output "secret_id" {
  value = azurerm_key_vault_certificate.key_vault_certificate.secret_id
}

output "version" {
  value = azurerm_key_vault_certificate.key_vault_certificate.version
}

output "certificate_data" {
  value = azurerm_key_vault_certificate.key_vault_certificate.certificate_data
}

output "thumbprint" {
  value = azurerm_key_vault_certificate.key_vault_certificate.thumbprint
}