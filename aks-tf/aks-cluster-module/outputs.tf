output "aks_cluster_name" {
    description = "stores the name of the aks cluster"
    value = azurerm_kubernetes_cluster.aks_cluster.name
}

output "aks_cluster_id" {
    description = "stores the id of the aks cluster"
    value = azurerm_kubernetes_cluster.aks_cluster.id
}

output "aks_kube_config" {
    description = "stores the raw kube configuration of the aks cluster"
    value = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
}