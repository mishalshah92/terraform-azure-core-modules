resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group

  sku_tier           = var.sku_tier
  kubernetes_version = var.kubernetes_version

  ## Scaling
  ## https://docs.microsoft.com/en-us/azure/aks/cluster-autoscaler#using-the-autoscaler-profile
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

  ## Default Node pool
  node_resource_group = var.node_resource_group

  dynamic "default_node_pool" {
    for_each = var.default_node_pool
    content {
      name = default_node_pool.value.name

      ### Network
      pod_subnet_id            = lookup(default_node_pool.value, "pod_subnet_id", null)
      vnet_subnet_id           = lookup(default_node_pool.value, "vnet_subnet_id", null)
      enable_host_encryption   = lookup(default_node_pool.value, "enable_host_encryption", false)
      availability_zones       = lookup(default_node_pool.value, "availability_zones", [])
      enable_node_public_ip    = lookup(default_node_pool.value, "enable_node_public_ip", false)
      node_public_ip_prefix_id = lookup(default_node_pool.value, "enable_node_public_ip", false) ? lookup(default_node_pool.value, "node_public_ip_prefix_id", null) : null
      os_disk_size_gb          = lookup(default_node_pool.value, "os_disk_size_gb", null)
      os_disk_type             = lookup(default_node_pool.value, "os_disk_type", null)
      os_sku                   = lookup(default_node_pool.value, "os_sku", "Ubuntu")
      type                     = lookup(default_node_pool.value, "type", "VirtualMachineScaleSets")

      ### Kubelet
      kubelet_disk_type = lookup(default_node_pool.value, "kubelet_disk_type", "OS")
      dynamic "kubelet_config" {
        for_each = lookup(default_node_pool.value, "kubelet_config", [])

        content {
          allowed_unsafe_sysctls    = lookup(kubelet_config.value, "allowed_unsafe_sysctls", [])
          container_log_max_line    = lookup(kubelet_config.value, "container_log_max_line", 3)
          container_log_max_size_mb = lookup(kubelet_config.value, "container_log_max_size_mb", 20)
          cpu_cfs_quota_enabled     = lookup(kubelet_config.value, "cpu_cfs_quota_enabled", null)
          cpu_cfs_quota_period      = lookup(kubelet_config.value, "cpu_cfs_quota_period", null)
          cpu_manager_policy        = lookup(kubelet_config.value, "cpu_manager_policy", null)
          image_gc_high_threshold   = lookup(kubelet_config.value, "image_gc_high_threshold", null)
          image_gc_low_threshold    = lookup(kubelet_config.value, "image_gc_low_threshold", null)
          pod_max_pid               = lookup(kubelet_config.value, "pod_max_pid", null)
          topology_manager_policy   = lookup(kubelet_config.value, "topology_manager_policy", null)
        }
      }

      ### VM
      vm_size             = default_node_pool.value.vm_size
      enable_auto_scaling = lookup(default_node_pool.value, "enable_auto_scaling", false)
      fips_enabled        = var.fips_enabled
      ultra_ssd_enabled   = lookup(default_node_pool.value, "ultra_ssd_enabled", false)
      dynamic "linux_os_config" {
        for_each = lookup(default_node_pool.value, "linux_os_config", [])
        content {
          swap_file_size_mb = lookup(linux_os_config.value, "swap_file_size_mb", null)

          dynamic "sysctl_config" {
            for_each = lookup(linux_os_config.value, "sysctl_config", [])
            content {
              fs_aio_max_nr                      = sysctl_config.value.fs_aio_max_nr
              fs_file_max                        = sysctl_config.value.fs_file_max
              fs_inotify_max_user_watches        = sysctl_config.value.fs_inotify_max_user_watches
              fs_nr_open                         = sysctl_config.value.fs_nr_open
              kernel_threads_max                 = sysctl_config.value.kernel_threads_max
              net_core_netdev_max_backlog        = sysctl_config.value.net_core_netdev_max_backlog
              net_core_optmem_max                = sysctl_config.value.net_core_optmem_max
              net_core_rmem_default              = sysctl_config.value.net_core_rmem_default
              net_core_rmem_max                  = sysctl_config.value.net_core_rmem_max
              net_core_somaxconn                 = sysctl_config.value.kernenet_core_somaxconnl_threads_max
              net_core_wmem_default              = sysctl_config.value.net_core_wmem_default
              net_core_wmem_max                  = sysctl_config.value.net_core_wmem_max
              net_ipv4_ip_local_port_range_max   = sysctl_config.value.net_ipv4_ip_local_port_range_max
              net_ipv4_ip_local_port_range_min   = sysctl_config.value.net_ipv4_ip_local_port_range_min
              net_ipv4_neigh_default_gc_thresh1  = sysctl_config.value.net_ipv4_neigh_default_gc_thresh1
              net_ipv4_neigh_default_gc_thresh2  = sysctl_config.value.net_ipv4_neigh_default_gc_thresh2
              net_ipv4_neigh_default_gc_thresh3  = sysctl_config.value.net_ipv4_neigh_default_gc_thresh3
              net_ipv4_tcp_fin_timeout           = sysctl_config.value.net_ipv4_tcp_fin_timeout
              net_ipv4_tcp_keepalive_intvl       = sysctl_config.value.net_ipv4_tcp_keepalive_intvl
              net_ipv4_tcp_keepalive_probes      = sysctl_config.value.net_ipv4_tcp_keepalive_probes
              net_ipv4_tcp_keepalive_time        = sysctl_config.value.net_ipv4_tcp_keepalive_time
              net_ipv4_tcp_max_syn_backlog       = sysctl_config.value.net_ipv4_tcp_max_syn_backlog
              net_ipv4_tcp_max_tw_buckets        = sysctl_config.value.net_ipv4_tcp_max_tw_buckets
              net_ipv4_tcp_tw_reuse              = sysctl_config.value.net_ipv4_tcp_tw_reuse
              net_netfilter_nf_conntrack_buckets = sysctl_config.value.net_netfilter_nf_conntrack_buckets
              net_netfilter_nf_conntrack_max     = sysctl_config.value.net_netfilter_nf_conntrack_max
              vm_max_map_count                   = sysctl_config.value.vm_max_map_count
              vm_swappiness                      = sysctl_config.value.vm_swappiness
              vm_vfs_cache_pressure              = sysctl_config.value.vm_vfs_cache_pressure
            }
          }

          transparent_huge_page_defrag  = lookup(linux_os_config.value, "transparent_huge_page_defrag", null)
          transparent_huge_page_enabled = lookup(linux_os_config.value, "transparent_huge_page_enabled", null)
        }
      }


      ### Pods
      max_pods = lookup(default_node_pool.value, "max_pods", null)
      node_labels = lookup(default_node_pool.value, "node_labels", {
        default = true
      })
      only_critical_addons_enabled = lookup(default_node_pool.value, "only_critical_addons_enabled", null)
      orchestrator_version         = lookup(default_node_pool.value, "orchestrator_version", null)

      ### Upgrade Settings
      dynamic "upgrade_settings" {
        for_each = lookup(default_node_pool.value, "upgrade_settings", [])
        content {
          max_surge = lookup(upgrade_settings.value, "max_surge", null)
        }
      }

      ### Nodes
      max_count  = lookup(default_node_pool.value, "enable_auto_scaling", false) == true ? default_node_pool.value.max_count : null
      min_count  = lookup(default_node_pool.value, "enable_auto_scaling", false) == true ? default_node_pool.value.min_count : null
      node_count = default_node_pool.value.node_count

      tags = var.default_node_pool_tags == null ? local.tags : var.default_node_pool_tags
    }
  }

  ## Linux Profile
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

  ## Windows Profile
  dynamic "windows_profile" {
    for_each = var.windows_profile
    content {
      admin_username = windows_profile.value.admin_username
      admin_password = windows_profile.value.admin_password
    }
  }

  ## Identity
  dynamic "identity" {
    for_each = var.identity
    content {
      type                      = identity.value.type
      user_assigned_identity_id = identity.value.user_assigned_identity_id
    }
  }

  dynamic "service_principal" {
    for_each = var.service_principal
    content {
      client_id     = service_principal.value.client_id
      client_secret = service_principal.value.client_secret
    }
  }

  dynamic "kubelet_identity" {
    for_each = var.kubelet_identity
    content {
      client_id                 = kubelet_identity.value.client_id
      object_id                 = kubelet_identity.value.object_id
      user_assigned_identity_id = kubelet_identity.value.user_assigned_identity_id
    }
  }

  ## Authentication && Authorizations
  local_account_disabled = var.local_account_disabled

  dynamic "role_based_access_control" {
    for_each = var.role_based_access_control
    content {

      dynamic "azure_active_directory" {
        for_each = role_based_access_control.value.azure_active_directory
        content {
          managed   = azure_active_directory.value.managed
          tenant_id = lookup(azure_active_directory.value, "tenant_id", null)

          admin_group_object_ids = azure_active_directory.value.managed == true ? azure_active_directory.value.admin_group_object_ids : null
          azure_rbac_enabled     = azure_active_directory.value.managed == true ? azure_active_directory.value.azure_rbac_enabled : false

          client_app_id     = azure_active_directory.value.managed == false ? azure_active_directory.value.client_app_id : null
          server_app_id     = azure_active_directory.value.managed == false ? azure_active_directory.value.server_app_id : null
          server_app_secret = azure_active_directory.value.managed == false ? azure_active_directory.value.server_app_secret : null
        }
      }
      enabled = role_based_access_control.value.enabled
    }
  }

  ## Network
  dns_prefix                          = var.dns_prefix
  dns_prefix_private_cluster          = var.dns_prefix_private_cluster
  api_server_authorized_ip_ranges     = var.api_server_authorized_ip_ranges
  private_cluster_enabled             = var.private_cluster_enabled
  private_dns_zone_id                 = var.private_dns_zone_id
  private_cluster_public_fqdn_enabled = var.private_cluster_public_fqdn_enabled

  dynamic "http_proxy_config" {
    for_each = var.http_proxy_config
    content {
      http_proxy  = lookup(http_proxy_config.value, "http_proxy", null)
      https_proxy = lookup(http_proxy_config.value, "https_proxy", null)
      no_proxy    = lookup(http_proxy_config.value, "no_proxy", [])
    }
  }

  dynamic "network_profile" {
    for_each = var.network_profile
    content {
      network_plugin     = network_profile.value.network_plugin
      network_policy     = lookup(network_profile.value, "network_policy", "azure")
      dns_service_ip     = lookup(network_profile.value, "dns_service_ip", null)
      docker_bridge_cidr = lookup(network_profile.value, "docker_bridge_cidr", null)
      pod_cidr           = lookup(network_profile.value, "pod_cidr", null)
      service_cidr       = lookup(network_profile.value, "service_cidr", null)
      outbound_type      = lookup(network_profile.value, "outbound_type", "loadBalancer")
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

  ## Upgrade && Maintenance
  automatic_channel_upgrade = var.automatic_channel_upgrade

  dynamic "maintenance_window" {
    for_each = var.maintenance_window
    content {
      dynamic "allowed" {
        for_each = lookup(maintenance_window.value, "allowed", [])
        content {
          day   = allowed.value.day
          hours = allowed.value.hours
        }

      }
      dynamic "not_allowed" {
        for_each = lookup(maintenance_window.value, "not_allowed", [])
        content {
          end   = not_allowed.value.end
          start = not_allowed.value.start
        }

      }
    }
  }

  ## Addons
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
      dynamic "ingress_application_gateway" {
        for_each = lookup(addon_profile.value, "ingress_application_gateway", [])
        content {
          enabled      = ingress_application_gateway.value.enabled
          gateway_id   = ingress_application_gateway.value.gateway_id
          gateway_name = ingress_application_gateway.value.gateway_name
          subnet_cidr  = ingress_application_gateway.value.subnet_cidr
          subnet_id    = ingress_application_gateway.value.subnet_id
        }
      }
    }
  }

  tags = local.tags

  lifecycle {
    ignore_changes = [
      default_node_pool["node_count"]
    ]
  }
}