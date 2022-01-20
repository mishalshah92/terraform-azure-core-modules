resource "azurerm_cosmosdb_account" "db" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group
  offer_type          = var.offer_type
  kind                = var.kind

  enable_free_tier                  = var.enable_free_tier
  enable_automatic_failover         = var.enable_automatic_failover
  enable_multiple_write_locations   = var.enable_multiple_write_locations
  public_network_access_enabled     = var.public_network_access_enabled
  is_virtual_network_filter_enabled = var.is_virtual_network_filter_enabled

  key_vault_key_id = var.key_vault_key_id

  dynamic "virtual_network_rule" {
    for_each = var.virtual_network_rule
    content {
      id                                   = virtual_network_rule.value.id
      ignore_missing_vnet_service_endpoint = virtual_network_rule.value.ignore_missing_vnet_service_endpoint
    }
  }

  dynamic "capabilities" {
    for_each = var.capabilities
    content {
      name = capabilities.value.name
    }
  }

  dynamic "consistency_policy" {
    for_each = var.consistency_policy
    content {
      consistency_level       = consistency_policy.value.consistency_level
      max_interval_in_seconds = lookup(consistency_policy.value, "max_interval_in_seconds", 5)
      max_staleness_prefix    = lookup(consistency_policy.value, "max_staleness_prefix", 100)
    }
  }

  dynamic "geo_location" {
    for_each = var.geo_locations
    content {
      prefix            = lookup(geo_location.value, "prefix", null)
      failover_priority = geo_location.value.failover_priority
      location          = geo_location.value.location
      zone_redundant    = lookup(geo_location.value, "zone_redundant", false)
    }
  }

  lifecycle {
    ignore_changes = [
      ip_range_filter
    ]
  }

  tags = local.tags
}