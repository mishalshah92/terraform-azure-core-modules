data "git_repository" "current_repo" {
  path = path.root
}

data "azurerm_resource_group" "hub_rg" {
  name = var.hub_resource_group
}