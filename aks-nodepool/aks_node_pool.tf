resource "azurerm_kubernetes_cluster_node_pool" "node_pool" {
  name = var.name

  # Kubernetes
  kubernetes_cluster_id = var.kubernetes_cluster_id
  orchestrator_version  = var.orchestrator_version
  mode                  = var.mode

  # Pods
  max_pods = var.max_pods
  node_labels = var.node_labels == null ? {
    name : var.name
    } : merge({
      name : var.name
  }, var.node_labels)
  node_taints = var.node_taints

  # Autoscaling
  enable_auto_scaling = var.enable_auto_scaling
  node_count          = var.node_count
  max_count           = var.enable_auto_scaling ? var.max_count : null
  min_count           = var.enable_auto_scaling ? var.min_count : null

  # VM config
  vm_size                      = var.vm_size
  os_disk_size_gb              = var.os_disk_size_gb
  os_type                      = var.os_disk_type
  proximity_placement_group_id = var.proximity_placement_group_id

  # Network
  vnet_subnet_id     = var.vnet_subnet_id
  availability_zones = var.availability_zones

  # Spot
  priority        = var.priority
  eviction_policy = var.priority == "Spot" ? var.eviction_policy : null
  spot_max_price  = var.priority == "Spot" ? var.spot_max_price : null

  # Tags
  tags = var.tags
}