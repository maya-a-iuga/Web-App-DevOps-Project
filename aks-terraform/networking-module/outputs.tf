output "vnet_id" {
  description = "ID of the previously created VNet. Used within the cluster module to connect the cluster to the defined VNet."
  value       = azurerm_virtual_network.aks_vnet.id
}

output "control_plane_subnet_id" {
  description = "ID of the control plane subnet within the VNet. Specifies subnet where the control plane components of the AKS cluster will be deployed to."
  value       = azurerm_subnet.control_plane_subnet.id
}

output "worker_node_subnet_id" {
  description = "ID of the worker node subnet within the VNet. Specifies subnet where the worker nodes of the AKS cluster will be deployed to."
  value       = azurerm_subnet.worker_node_subnet.id
}

output "networking_resource_group_name" {
  description = "Name of the Azure Resource Group where the networking resources were provisioned in. Ensures the cluster module resources are provisioned within the same resource group."
  value       = azurerm_network_security_group.aks-ng.name
}

output "aks_nsg_id" {
  description = "ID of the Network Security Group (NSG). Associates the NSG with the AKS cluster for security rule enforcement and traffic filtering."
  value       = azurerm_network_security_group.aks-ng.id
}
