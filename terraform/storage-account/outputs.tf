output "name" {
  value = azurerm_storage_account.storage_account.name
}

output "id" {
  value = azurerm_storage_account.storage_account.id
}

output "primary_location" {
  value = azurerm_storage_account.storage_account.primary_location
}

output "secondary_location" {
  value = azurerm_storage_account.storage_account.secondary_location
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.storage_account.primary_blob_endpoint
}

output "secondary_blob_endpoint" {
  value = azurerm_storage_account.storage_account.secondary_blob_endpoint
}

output "primary_access_key" {
  value = azurerm_storage_account.storage_account.primary_access_key
}

output "secondary_access_key" {
  value = azurerm_storage_account.storage_account.secondary_access_key
}
