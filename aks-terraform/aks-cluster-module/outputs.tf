output "aks_cluster_name" {
  description = "Stores the Name of the cluster"
  value = azurerm_kubernetes_cluster.aks_cluster.name
}

output "aks_cluster_id" {
  description = "Stores the ID of the cluster"
  value = azurerm_kubernetes_cluster.aks_cluster.id
}

output "aks_kubeconfig" {
  description = "Captures the Kubernetes configuration file of the cluster"
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
}