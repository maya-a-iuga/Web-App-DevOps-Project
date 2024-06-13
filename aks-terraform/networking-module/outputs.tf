
output "vnet_id" {
  value       = azurerm_virtual_network.network.id
  description = "The ID of the Virtual Network."
}

output "control_plane_subnet_id" {
  value       = azurerm_subnet.control_plane.id
  description = "The ID of the control plane subnet within the VNet."
}

output "worker_node_subnet_id" {
  value       = azurerm_subnet.worker_nodes.id
  description = "The ID of the worker node subnet within the VNet."
}

output "networking_resource_group_name" {
  value       = azurerm_resource_group.networking.name
  description = "The name of the Azure Resource Group for networking resources."
}

output "aks_nsg_id" {
  value       = azurerm_network_security_group.aks.id
  description = "The ID of the Network Security Group (NSG) associated with the AKS cluster."
}
