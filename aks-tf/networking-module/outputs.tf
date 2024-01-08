output "vnet_id" {
  description = "stores ID of previously created VNet"
  value = azurerm_virtual_network.aks-vnet.id
}


output "control_plane_subnet_id" {
  description = "holds ID of control plane subnet within the VNet"
  value = azurerm_subnet.control-plane-subnet.id
}

output "worker_node_subnet_id" {
  description = "holds ID of worker node subnet within the VNet"
  value = azurerm_subnet.worker-node-subnet.id
}

output "networking_resource_group_name" {
  description = "provides name of the Azure Resource Group in which the networking resources were provisioned in"
  value = azurerm_resource_group.networking.name
}

output "aks_nsg_id" {
  description = "stores ID of the Network Security Group (NSG)"
  value = azurerm_network_security_group.aks-nsg.id
}