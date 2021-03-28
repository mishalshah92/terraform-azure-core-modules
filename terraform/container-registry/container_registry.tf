resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.resource_group
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled

  georeplication_locations = var.georeplication_locations

  dynamic "network_rule_set" {
    for_each = var.network_rule_set == null ? [] : ["true"]
    content {
      default_action = lookup(var.network_rule_set, "default_action", "Allow")

      dynamic "ip_rule" {
        for_each = lookup(var.network_rule_set, "ip_rule", null) == null ? [] : var.network_rule_set.ip_rule
        content {
          action   = ip_rule.value.action
          ip_range = ip_rule.value.ip_range
        }
      }

      dynamic "virtual_network" {
        for_each = lookup(var.network_rule_set, "virtual_network", null) == null ? [] : var.network_rule_set.virtual_network
        content {
          action    = ip_rule.value.action
          subnet_id = ip_rule.value.subnet_id
        }
      }

    }
  }

  retention_policy {
    days    = var.retention_days
    enabled = var.retention_days == 0 ? false : true
  }

  trust_policy {
    enabled = var.trust_policy
  }

  tags = local.tags
}