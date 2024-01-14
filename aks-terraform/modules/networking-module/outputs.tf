output "vnet_id" {
  value = azurerm_virtual_network.aks_vnet.id
  description = "The ID of the Virtual Network."
}

output "control_plane_subnet_id" {
  value = azurerm_subnet.control_plane_subnet.id
  description = "The ID of the control plane subnet within the VNet."
}

output "worker_node_subnet_id" {
  value = azurerm_subnet.worker_node_subnet.id
  description = "The ID of the worker node subnet within the VNet."
}

output "networking_resource_group_name" {
  value = azurerm_resource_group.aks_rg.name
  description = "The name of the Azure Resource Group where the networking resources were provisioned."
}
output "aks_nsg_id" {
  value = azurerm_network_security_group.aks_nsg.id
  description = "The ID of the Network Security Group."
}

