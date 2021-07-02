output "id" {
  value = azurerm_kubernetes_cluster.aks_cluster.id
}

output "fqdn" {
  value = azurerm_kubernetes_cluster.aks_cluster.fqdn
}

output "private_fqdn" {
  value = azurerm_kubernetes_cluster.aks_cluster.private_fqdn
}

output "node_resource_group" {
  value = azurerm_kubernetes_cluster.aks_cluster.node_resource_group
}

output "kubelet_identity" {
  value = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity
}