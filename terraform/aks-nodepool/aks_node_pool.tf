locals {
  node_labels = var.node_labels == null ? {
    name : var.name
    } : merge({
      name : var.name
  }, var.node_labels)
}

resource "azurerm_kubernetes_cluster_node_pool" "node_pool" {
  name = var.name

  # Kubernetes
  kubernetes_cluster_id = var.kubernetes_cluster_id
  orchestrator_version  = var.orchestrator_version
  mode                  = var.mode

  # Pods
  max_pods      = var.max_pods
  pod_subnet_id = var.pod_subnet_id
  node_labels   = local.node_labels
  node_taints   = var.node_taints

  # Autoscaling
  enable_auto_scaling = var.enable_auto_scaling
  node_count          = var.node_count
  max_count           = var.enable_auto_scaling ? var.max_count : null
  min_count           = var.enable_auto_scaling ? var.min_count : null

  # VM config
  vm_size                      = var.vm_size
  os_disk_size_gb              = var.os_disk_size_gb
  os_disk_type                 = var.os_disk_type
  os_type                      = var.os_type
  os_sku                       = var.os_sku
  proximity_placement_group_id = var.proximity_placement_group_id
  enable_host_encryption       = var.enable_host_encryption
  fips_enabled                 = var.fips_enabled
  ultra_ssd_enabled            = var.ultra_ssd_enabled

  # Network
  vnet_subnet_id           = var.vnet_subnet_id
  availability_zones       = var.availability_zones
  enable_node_public_ip    = var.enable_node_public_ip
  node_public_ip_prefix_id = var.enable_node_public_ip ? var.node_public_ip_prefix_id : null

  # Spot
  priority        = var.priority
  eviction_policy = var.priority == "Spot" ? var.eviction_policy : null
  spot_max_price  = var.priority == "Spot" ? var.spot_max_price : null

  # kubelet config
  kubelet_disk_type = var.kubelet_disk_type
  dynamic "kubelet_config" {
    for_each = var.kubelet_config

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

  # Linux config
  dynamic "linux_os_config" {
    for_each = var.linux_os_config
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


  dynamic "upgrade_settings" {
    for_each = var.upgrade_settings
    content {
      max_surge = lookup(upgrade_settings.value, "max_surge", null)
    }
  }

  # Tags
  tags = local.tags
}