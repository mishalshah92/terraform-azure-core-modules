resource "azurerm_redis_cache" "redis" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group

  # Config
  family      = var.family
  sku_name    = var.sku_name
  capacity    = var.capacity
  shard_count = var.shard_count

  # Patch Schedule
  dynamic "patch_schedule" {
    for_each = var.patch_schedule == null ? [] : ["true"]
    content {
      day_of_week    = var.patch_schedule.day_of_week
      start_hour_utc = lookup(var.patch_schedule, "start_hour_utc", 0)
    }
  }

  # Network
  subnet_id                     = var.sku_name == "Premium" ? var.subnet_id : null
  zones                         = var.zones
  private_static_ip_address     = var.private_static_ip_address
  public_network_access_enabled = var.public_network_access_enabled
  enable_non_ssl_port           = var.enable_non_ssl_port
  minimum_tls_version           = var.minimum_tls_version

  # Redis configurations
  dynamic "redis_configuration" {
    for_each = var.redis_configurations == null ? [] : ["true"]
    content {
      enable_authentication           = lookup(var.redis_configurations, "enable_authentication", false)
      maxmemory_reserved              = lookup(var.redis_configurations, "maxmemory_reserved", null)
      maxmemory_delta                 = lookup(var.redis_configurations, "maxmemory_delta", null)
      maxmemory_policy                = lookup(var.redis_configurations, "maxmemory_policy", null)
      maxfragmentationmemory_reserved = lookup(var.redis_configurations, "maxfragmentationmemory_reserved", null)
      rdb_backup_enabled              = lookup(var.redis_configurations, "rdb_backup_enabled", null)
      rdb_backup_frequency            = lookup(var.redis_configurations, "rdb_backup_frequency", null)
      rdb_backup_max_snapshot_count   = lookup(var.redis_configurations, "rdb_backup_max_snapshot_count", null)
      rdb_storage_connection_string   = lookup(var.redis_configurations, "rdb_storage_connection_string", null)
      notify_keyspace_events          = lookup(var.redis_configurations, "notify_keyspace_events", null)
    }
  }

  tags = local.tags
}