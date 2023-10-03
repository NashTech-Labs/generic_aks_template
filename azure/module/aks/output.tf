# Output the AKS cluster name
output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name
}

# Output the AKS cluster resource group name
output "aks_resource_group_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.resource_group_name
}

# Output the AKS cluster DNS prefix
output "aks_dns_prefix" {
  value = azurerm_kubernetes_cluster.aks_cluster.dns_prefix
}
output "kubeconfig" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config
  sensitive = true
}