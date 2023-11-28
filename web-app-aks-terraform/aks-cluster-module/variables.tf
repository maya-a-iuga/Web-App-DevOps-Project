variable "aks_cluster_name" {
    description = "The name of the AKS Cluster."
    type = string
    default = "myakscluster"
}

variable "cluster_location" {
  description = "The Azure region where the AKS cluster should be created."
  type        = string
  default     = "UK South"
}

variable "dns_prefix" {
  description = "The DNS prefix to use for the AKS cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use for the AKS cluster."
  type        = string
}

variable "service_principal_client_id" {
  description = "The client ID of the service principal used by AKS."
  type        = string
}

variable "service_principal_client_secret" {
  description = "The client secret associated with the service principal."
  type        = string
}


# Input variables from the networking module
variable "resource_group_name" {
  description = "The name of the Azure resource group."
  type        = string
}

variable "vnet_id" {
  description = "The ID of the virtual network where the AKS cluster should be placed."
  type        = string
}

variable "aks_nsg_id" {
  description = "ID of the Network Security Group (NSG) for AKS."
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