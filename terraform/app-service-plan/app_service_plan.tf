resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group

  kind                         = var.kind
  maximum_elastic_worker_count = var.maximum_elastic_worker_count

  app_service_environment_id = var.app_service_environment_id
  reserved                   = var.reserved
  per_site_scaling           = var.per_site_scaling

  sku {
    size     = var.sku_size
    tier     = var.sku_tier
    capacity = var.sku_capacity
  }

  tags = var.tags
}
