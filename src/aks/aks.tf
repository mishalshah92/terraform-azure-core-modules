resource "azurerm_kubernetes_cluster" "aks_cluster" {

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group
  node_resource_group = var.node_resource_group

  # https://docs.microsoft.com/en-us/azure/aks/cluster-autoscaler#using-the-autoscaler-profile
  dynamic "auto_scaler_profile" {
    for_each = var.auto_scaler_profile
    content {
      balance_similar_node_groups      = lookup(auto_scaler_profile.value, "balance_similar_node_groups", false)
      max_graceful_termination_sec     = lookup(auto_scaler_profile.value, "max_graceful_termination_sec", 600)
      new_pod_scale_up_delay           = lookup(auto_scaler_profile.value, "new_pod_scale_up_delay", "10s")
      scale_down_delay_after_add       = lookup(auto_scaler_profile.value, "scale_down_delay_after_add", "10m")
      scale_down_delay_after_delete    = lookup(auto_scaler_profile.value, "scale_down_delay_after_delete", "10s")
      scale_down_delay_after_failure   = lookup(auto_scaler_profile.value, "scale_down_delay_after_failure", "3m")
      scan_interval                    = lookup(auto_scaler_profile.value, "scan_interval", "10s")
      scale_down_unneeded              = lookup(auto_scaler_profile.value, "scale_down_unneeded", "10m")
      scale_down_unready               = lookup(auto_scaler_profile.value, "scale_down_unready", "20m")
      scale_down_utilization_threshold = lookup(auto_scaler_profile.value, "scale_down_utilization_threshold", "0.5")
      skip_nodes_with_local_storage    = lookup(auto_scaler_profile.value, "skip_nodes_with_local_storage", true)
      skip_nodes_with_system_pods      = lookup(auto_scaler_profile.value, "skip_nodes_with_system_pods", true)
    }
  }

  sku_tier           = var.sku_tier
  kubernetes_version = var.kubernetes_version

  dynamic "default_node_pool" {
    for_each = var.default_node_pool
    content {
      name                  = default_node_pool.value.name
      vm_size               = default_node_pool.value.vm_size
      availability_zones    = lookup(default_node_pool.value, "availability_zones", [])
      enable_auto_scaling   = lookup(default_node_pool.value, "enable_auto_scaling", false)
      enable_node_public_ip = lookup(default_node_pool.value, "enable_node_public_ip", false)
      max_pods              = lookup(default_node_pool.value, "max_pods", null)
      node_labels = lookup(default_node_pool.value, "node_labels", {
        default = true
      })
      orchestrator_version = lookup(default_node_pool.value, "orchestrator_version", null)
      os_disk_size_gb      = lookup(default_node_pool.value, "os_disk_size_gb", null)
      os_disk_type         = lookup(default_node_pool.value, "os_disk_type", null)
      type                 = lookup(default_node_pool.value, "type", "VirtualMachineScaleSets")
      tags                 = var.default_node_pool_tags == null ? var.tags : var.default_node_pool_tags
      vnet_subnet_id       = lookup(default_node_pool.value, "vnet_subnet_id", null)

      max_count  = lookup(default_node_pool.value, "enable_auto_scaling", false) == true ? default_node_pool.value.max_count : null
      min_count  = lookup(default_node_pool.value, "enable_auto_scaling", false) == true ? default_node_pool.value.min_count : null
      node_count = default_node_pool.value.node_count
    }
  }


  disk_encryption_set_id = var.disk_encryption_set_id

  dynamic "linux_profile" {
    for_each = var.linux_profile
    content {
      admin_username = linux_profile.value.admin_username
      ssh_key {
        key_data = linux_profile.value.ssh_key_data
      }
    }
  }

  dynamic "windows_profile" {
    for_each = var.windows_profile
    content {
      admin_username = windows_profile.value.admin_username
      admin_password = windows_profile.value.admin_password
    }
  }

  dynamic "identity" {
    for_each = var.identity_type == null ? [] : ["true"]
    content {
      type = var.identity_type
    }
  }

  dynamic "role_based_access_control" {
    for_each = var.role_based_access_control
    content {
      azure_active_directory {
        managed   = role_based_access_control.value.azure_active_directory.managed
        tenant_id = lookup(role_based_access_control.value.azure_active_directory, "tenant_id", null)

        admin_group_object_ids = role_based_access_control.value.azure_active_directory.managed == true ? role_based_access_control.value.azure_active_directory.admin_group_object_ids : null
        client_app_id          = role_based_access_control.value.azure_active_directory.managed == false ? role_based_access_control.value.azure_active_directory.client_app_id : null
        server_app_id          = role_based_access_control.value.azure_active_directory.managed == false ? role_based_access_control.value.azure_active_directory.server_app_id : null
        server_app_secret      = role_based_access_control.value.azure_active_directory.managed == false ? role_based_access_control.value.azure_active_directory.server_app_secret : null
      }
      enabled = role_based_access_control.value.enabled
    }
  }

  dynamic "service_principal" {
    for_each = var.service_principal
    content {
      client_id     = service_principal.value.client_id
      client_secret = service_principal.value.client_secret
    }
  }

  dns_prefix              = var.dns_prefix
  private_cluster_enabled = var.private_cluster_enabled

  dynamic "network_profile" {
    for_each = var.network_profile
    content {
      network_plugin     = network_profile.value.network_plugin
      network_policy     = lookup(network_profile.value, "network_policy", "azure")
      dns_service_ip     = lookup(network_profile.value, "dns_service_ip", null)
      docker_bridge_cidr = lookup(network_profile.value, "docker_bridge_cidr", null)
      outbound_type      = lookup(network_profile.value, "outbound_type", "loadBalancer")
      pod_cidr           = lookup(network_profile.value, "pod_cidr", null)
      service_cidr       = lookup(network_profile.value, "service_cidr", null)
      load_balancer_sku  = lookup(network_profile.value, "load_balancer_sku", "Standard")

      dynamic "load_balancer_profile" {
        for_each = var.network_load_balancer_profile
        content {
          outbound_ports_allocated  = lookup(load_balancer_profile.value, "outbound_ports_allocated", 0)
          idle_timeout_in_minutes   = lookup(load_balancer_profile.value, "idle_timeout_in_minutes", 30)
          managed_outbound_ip_count = lookup(load_balancer_profile.value, "managed_outbound_ip_count", null)
          outbound_ip_prefix_ids    = lookup(load_balancer_profile.value, "outbound_ip_prefix_ids", null)
          outbound_ip_address_ids   = lookup(load_balancer_profile.value, "outbound_ip_address_ids", null)
        }
      }
    }
  }

  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges

  dynamic "addon_profile" {
    for_each = var.addon_profile
    content {
      dynamic "aci_connector_linux" {
        for_each = lookup(addon_profile.value, "aci_connector_linux", [])
        content {
          enabled     = aci_connector_linux.value.enabled
          subnet_name = aci_connector_linux.value.subnet_name
        }
      }
      dynamic "azure_policy" {
        for_each = lookup(addon_profile.value, "azure_policy", [])
        content {
          enabled = azure_policy.value.enabled
        }
      }
      dynamic "http_application_routing" {
        for_each = lookup(addon_profile.value, "http_application_routing", [])
        content {
          enabled = http_application_routing.value.enabled
        }
      }
      dynamic "kube_dashboard" {
        for_each = lookup(addon_profile.value, "kube_dashboard", [])
        content {
          enabled = kube_dashboard.value.enabled
        }
      }
      dynamic "oms_agent" {
        for_each = lookup(addon_profile.value, "oms_agent", [])
        content {
          enabled                    = oms_agent.value.enabled
          log_analytics_workspace_id = lookup(oms_agent.value, "log_analytics_workspace_id", null)
          dynamic "oms_agent_identity" {
            for_each = lookup(oms_agent.value, "oms_agent_identity", [])
            content {
              client_id                 = oms_agent_identity.value.client_id
              object_id                 = oms_agent_identity.value.object_id
              user_assigned_identity_id = oms_agent_identity.value.user_assigned_identity_id
            }
          }
        }
      }
    }
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      default_node_pool["node_count"]
    ]
  }
}