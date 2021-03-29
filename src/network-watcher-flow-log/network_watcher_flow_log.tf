resource "azurerm_network_watcher_flow_log" "nsg_flow_logs" {

  network_watcher_name = var.network_watcher_name
  resource_group_name  = var.resource_group

  network_security_group_id = var.network_security_group_id
  storage_account_id        = var.storage_account_id
  enabled                   = var.enabled

  retention_policy {
    enabled = var.enable_retention_policy
    days    = var.retention_days
  }
}