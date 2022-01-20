resource "azurerm_storage_account" "storage_account" {

  name                = var.name
  resource_group_name = var.resource_group
  location            = var.location

  account_kind             = var.account_kind
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  enable_https_traffic_only = var.enable_https_traffic_only
  min_tls_version           = var.min_tls_version

  allow_blob_public_access = var.allow_blob_public_access
  large_file_share_enabled = var.large_file_share_enabled

  dynamic "network_rules" {
    for_each = var.network_rules
    content {
      default_action             = network_rules.value.default_action
      bypass                     = lookup(network_rules.value, "bypass", null)
      ip_rules                   = lookup(network_rules.value, "ip_rules", null)
      virtual_network_subnet_ids = lookup(network_rules.value, "virtual_network_subnet_ids", null)
    }
  }

  dynamic "custom_domain" {
    for_each = var.custom_domain
    content {
      name          = custom_domain.value.name
      use_subdomain = lookup(custom_domain.value, "use_subdomain", null)
    }
  }

  dynamic "blob_properties" {
    for_each = var.blob_properties
    content {

      dynamic "cors_rule" {
        for_each = lookup(blob_properties.value, "cors_rule", [])
        content {
          allowed_headers    = cors_rule.value.allowed_headers
          allowed_methods    = cors_rule.value.allowed_methods
          allowed_origins    = cors_rule.value.allowed_origins
          exposed_headers    = cors_rule.value.exposed_headers
          max_age_in_seconds = cors_rule.value.max_age_in_seconds
        }
      }

      dynamic "delete_retention_policy" {
        for_each = lookup(blob_properties.value, "delete_retention_policy", [])
        content {
          days = delete_retention_policy.value.days
        }
      }

    }
  }

  dynamic "identity" {
    for_each = var.identity
    content {
      type = lookup(identity.value, "type", "SystemAssigned")
    }
  }

  dynamic "queue_properties" {
    for_each = var.queue_properties
    content {

      dynamic "cors_rule" {
        for_each = lookup(queue_properties.value, "cors_rule", [])
        content {
          allowed_headers    = cors_rule.value.allowed_headers
          allowed_methods    = cors_rule.value.allowed_methods
          allowed_origins    = cors_rule.value.allowed_origins
          exposed_headers    = cors_rule.value.exposed_headers
          max_age_in_seconds = cors_rule.value.max_age_in_seconds
        }
      }

      dynamic "logging" {
        for_each = lookup(queue_properties.value, "logging", [])
        content {
          delete                = logging.value.delete
          read                  = logging.value.read
          version               = logging.value.version
          write                 = logging.value.write
          retention_policy_days = lookup(logging.value, "retention_policy_days", 0)
        }
      }

      dynamic "minute_metrics" {
        for_each = lookup(queue_properties.value, "minute_metrics", [])
        content {
          enabled               = minute_metrics.value.enabled
          version               = minute_metrics.value.version
          include_apis          = lookup(minute_metrics.value, "include_apis", null)
          retention_policy_days = lookup(minute_metrics.value, "retention_policy_days", 0)
        }
      }

      dynamic "hour_metrics" {
        for_each = lookup(queue_properties.value, "hour_metrics", [])
        content {
          enabled               = hour_metrics.value.enabled
          version               = hour_metrics.value.version
          include_apis          = lookup(hour_metrics.value, "include_apis", null)
          retention_policy_days = lookup(hour_metrics.value, "retention_policy_days", 0)
        }
      }

    }
  }

  dynamic "static_website" {
    for_each = var.static_website
    content {
      index_document     = lookup(static_website.value, "index_document", null)
      error_404_document = lookup(static_website.value, "error_404_document", null)
    }
  }

  tags = local.tags
}