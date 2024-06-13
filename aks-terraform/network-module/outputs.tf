output "vnet_id" {
    description = "For storing the ID of the previously created vnet"
    value = azure_resource_group.aks-vnet.name
}

output "control_plane_subnet_id" {
    description = "For storing the Id of the control plane subnet within the vnet"
    value = azure_resource_group.aks-vnet.control_plane_subnet_id.name

}

output "worker_node_subnet_id" {
    description = "For storing the Id of the worker node subnet within the vnet"
    value = azure_resource_group.aks-vnet.worker_node_subnet_id.name
}

output "networking_resource_group_name" {
    description = "Azure resource group for provisioning the network group"
    value = var.resource_group_name.default
}

output "aks_nsg_id" {
    description = " To store the ID of the network security group (NSG)"
    value = azure_resource_group.aks_nsg.name

}