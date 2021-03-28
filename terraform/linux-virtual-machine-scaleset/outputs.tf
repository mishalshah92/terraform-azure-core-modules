output "id" {
  value = azurerm_linux_virtual_machine_scale_set.vm_scale_set_template.id
}

output "identity" {
  value = azurerm_linux_virtual_machine_scale_set.vm_scale_set_template.identity
}

output "unique_id" {
  value = azurerm_linux_virtual_machine_scale_set.vm_scale_set_template.unique_id
}