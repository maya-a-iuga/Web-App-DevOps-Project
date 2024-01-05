variable "aks_cluster_name" {
  description = "Cluster name"
  type        = string
  default     = "WebAppCluster"
}

variable "cluster_location" {
  description = "Region in which to define resources"
  type        = string
  default     = "UK South"
}

variable "dns_prefix" {
  type        = string
  default     = "aks-webapp"
}

variable "kubernetes_version" {
  type        = string
  default     = "1.28"
  # az aks get-versions -l 'UK South' --query='[values][*][*][version]'
}

variable "service_principal_client_id" {
  type        = string
}

variable "service_principal_client_secret" {
  type        = string
}


# Output variables from the networking module

variable "vnet_id" {
  description = "ID of the Virtual Network (VNet)."
  type        = string
}

variable "control_plane_subnet_id" {
  description = "ID of the control plane subnet."
  type        = string
}

variable "worker_node_subnet_id" {
  description = "ID of the worker node subnet."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group for networking resources."
  type        = string
}

# variable "aks_nsg_id" {
#   description = "ID of the Network Security Group (NSG) for AKS."
#   type        = string
# }