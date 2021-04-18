output "tags" {
  value = local.tags
}

output "default_tags" {
  value = local.default_tags
}

output "hub_rg" {
  value = data.azurerm_resource_group.hub_rg
}