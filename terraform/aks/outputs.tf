output "id" {
  value = azurerm_kubernetes_cluster.aks_cluster.id
}

output "fqdn" {
  value = azurerm_kubernetes_cluster.aks_cluster.fqdn
}

output "private_fqdn" {
  value = azurerm_kubernetes_cluster.aks_cluster.private_fqdn
}

output "kube_admin_config" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_admin_config
}

output "kube_admin_config_raw" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_admin_config_raw
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config
}

output "kube_config_raw" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
}

output "node_resource_group" {
  value = azurerm_kubernetes_cluster.aks_cluster.node_resource_group
}

output "addon_profile" {
  value = azurerm_kubernetes_cluster.aks_cluster.addon_profile
}

output "identity" {
  value = azurerm_kubernetes_cluster.aks_cluster.identity
}