resource "azurerm_postgresql_server" "postgresql_server" {

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group

  # Config
  create_mode                   = var.create_mode
  sku_name                      = var.sku_name
  version                       = var.db_version
  public_network_access_enabled = substr(var.sku_name, 0, 1) == "B" ? null : var.public_network_access_enabled

  # Auth
  administrator_login          = var.administrator_username
  administrator_login_password = var.administrator_password

  identity {
    type = var.identity_type
  }

  # Storage
  auto_grow_enabled = var.auto_grow_enabled
  storage_mb        = var.storage_mb

  # Encryption & SSL
  infrastructure_encryption_enabled = substr(var.sku_name, 0, 1) == "B" ? null : var.infrastructure_encryption_enabled
  ssl_enforcement_enabled           = var.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced  = var.ssl_minimal_tls_version_enforced

  # Backup
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  creation_source_server_id    = var.creation_source_server_id
  restore_point_in_time        = var.restore_point_in_time

  # Threat Detection

  dynamic "threat_detection_policy" {
    for_each = var.threat_detection_policy
    content {
      enabled                    = threat_detection_policy.value.enabled
      disabled_alerts            = threat_detection_policy.value.disabled_alerts
      email_account_admins       = threat_detection_policy.value.email_account_admins
      email_addresses            = threat_detection_policy.value.email_addresses
      retention_days             = threat_detection_policy.value.retention_days
      storage_account_access_key = threat_detection_policy.value.storage_account_access_key
      storage_endpoint           = threat_detection_policy.value.storage_endpoint
    }
  }

  lifecycle {
    ignore_changes = [
      storage_mb
    ]
  }

  # Additional
  tags = local.tags
}