output "resource_group_name" {
  value = module.networking.networking_resource_group_name
}

output "aks_cluster_name" {
  value = module.aks_cluster.aks_cluster_name
}