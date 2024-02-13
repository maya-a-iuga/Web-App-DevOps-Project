# aks-cluster/variables.tf

variable "aks_cluster_name" {
  description = "The name of the AKS cluster that will be created"
  type        = string
}

variable "cluster_location" {
  description = "The Azure region where the AKS cluster will be created"
  type        = string
  default     = "UK South"
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster, which is used to create a unique DNS name for the cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to be used for the AKS cluster."
  type        = string
}

variable "service_principal_client_id" {
  description = "The lient ID of the service principal used for authenticating and managing the AKS cluster."
  type        = string
}

variable "service_principal_client_secret" {
  description = "The Client Secret associated with the service principal used for AKS cluster authentication."
  type        = string
}

# Input variables from the networking module
variable "resource_group_name" {
  description = "Name of the Azure Resource Group for networking resources."
  type        = string

}

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

variable "aks_nsg_id" {
  description = "ID of the Network Security Group (NSG) for AKS."
  type        = string

}
