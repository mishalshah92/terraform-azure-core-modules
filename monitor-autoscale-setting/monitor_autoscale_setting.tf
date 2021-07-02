resource "azurerm_monitor_autoscale_setting" "autoscale_setting" {
  name                = var.name
  resource_group_name = var.resource_group
  location            = var.location
  target_resource_id  = var.target_resource_id
  enabled             = var.enabled

  dynamic "profile" {
    for_each = var.profile
    content {

      name = profile.value.name

      capacity {
        default = profile.value.capacity.default
        minimum = profile.value.capacity.minimum
        maximum = profile.value.capacity.maximum
      }

      dynamic "rule" {
        for_each = profile.value.rule
        content {

          dynamic "metric_trigger" {
            for_each = lookup(rule.value, "metric_trigger", null) == null ? [] : ["true"]
            content {
              metric_name        = rule.value.metric_trigger.metric_name
              metric_resource_id = rule.value.metric_trigger.metric_resource_id
              operator           = rule.value.metric_trigger.operator
              statistic          = rule.value.metric_trigger.statistic
              time_aggregation   = rule.value.metric_trigger.time_aggregation
              time_grain         = rule.value.metric_trigger.time_grain
              time_window        = rule.value.metric_trigger.time_window
              threshold          = rule.value.metric_trigger.threshold
            }
          }

          dynamic "scale_action" {
            for_each = lookup(rule.value, "scale_action", null) == null ? [] : ["true"]
            content {
              cooldown  = rule.value.scale_action.cooldown
              direction = rule.value.scale_action.direction
              type      = rule.value.scale_action.type
              value     = rule.value.scale_action.value
            }
          }

        }
      }

      dynamic "fixed_date" {
        for_each = lookup(profile.value, "fixed_date", null) == null ? [] : ["true"]
        content {
          end      = profile.value.fixed_date.end
          start    = profile.value.fixed_date.start
          timezone = lookup(profile.value.fixed_date, "timezone", "UTC")
        }
      }

      dynamic "recurrence" {
        for_each = lookup(profile.value, "recurrence", null) == null ? [] : ["true"]
        content {
          days     = profile.value.recurrence.days
          hours    = profile.value.recurrence.hours
          minutes  = profile.value.recurrence.minutes
          timezone = profile.value.recurrence.timezone

        }
      }
    }
  }

  dynamic "notification" {
    for_each = var.notification == null ? [] : ["true"]
    content {

      dynamic "email" {
        for_each = lookup(var.notification, "email", null) == null ? [] : ["true"]
        content {
          send_to_subscription_administrator    = lookup(var.notification.email, "send_to_subscription_administrator", false)
          send_to_subscription_co_administrator = lookup(var.notification.email, "send_to_subscription_co_administrator", false)
          custom_emails                         = lookup(var.notification.email, "custom_emails", null)
        }
      }

      dynamic "webhook" {
        for_each = lookup(var.notification, "webhook", [])
        content {
          service_uri = webhook.value.service_uri
          properties  = webhook.value.properties
        }
      }
    }

  }

  tags = var.tags
}