# 1. A vnet_id variable that will store the ID of the previously created VNet. 
# This will be used within the cluster module to connect the cluster to the defined VNet.

output "vnet_id" {
  description = "ID of the Virtual Network (VNet)."
  value       = azurerm_virtual_network.aks-vnet.id
}

# 2. A control_plane_subnet_id variable that will hold the ID of the control plane subnet within the VNet. 
# This will be used to specify the subnet where the control plane components of the AKS cluster will be deployed to.

output "control_plane_subnet_id" {
  description = "ID of the control plane subnet."
  value       = azurerm_subnet.control-plane-subnet.id
}


# 3. A worker_node_subnet_id variable that will store the ID of the worker node subnet within the VNet. 
# This will be used to specify the subnet where the worker nodes of the AKS cluster will be deployed to.

output "worker_node_subnet_id" {
  description = "ID of the worker node subnet."
  value       = azurerm_subnet.worker-node-subnet.id
}

# 4. A networking_resource_group_name variable that will provide 
# the name of the Azure Resource Group where the networking resources were provisioned in.
# This will be used to ensure the cluster module resources are provisioned within the same resource group.

output "resource_group_name" {
  description = "Name of the Azure Resource Group for networking resources."
  value       = azurerm_resource_group.aks_networking.name
}

# 5. A aks_nsg_id variable that will store the ID of the Network Security Group (NSG). 
# This will be used to associate the NSG with the AKS cluster for security rule enforcement and traffic filtering.

output "aks_nsg_id" {
  description = "ID of the Network Security Group (NSG) for AKS."
  value       = azurerm_network_security_group.aks-nsg.id
}