output "aks_cluster_name" {
  value       = azurerm_kubernetes_cluster.aks_cluster.name
  description = "The name of the provisioned AKS cluster."
}

output "aks_cluster_id" {
  value       = azurerm_kubernetes_cluster.aks_cluster.id
  description = "The ID of the provisioned AKS cluster."
}

output "aks_kubeconfig" {
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  description = "The Kubernetes configuration file for managing the AKS cluster with kubectl."
}

