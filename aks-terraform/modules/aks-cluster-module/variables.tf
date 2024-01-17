variable "cluster_name" {
  type        = string
  description = "The name of the AKS cluster."
}

variable "location" {
  type        = string
  description = "The Azure region where the AKS cluster will be deployed."
}

variable "dns_prefix" {
  type        = string
  description = "The DNS prefix for the AKS cluster."
}

variable "kubernetes_version" {
  type        = string
  description = "The specific version of Kubernetes to use for the AKS cluster."
}

variable "service_principal_client_id" {
  type        = string
  description = "The Client ID for the service principal associated with the AKS cluster."
}

variable "service_principal_secret" {
  type        = string
  description = "The Client Secret for the service principal associated with the AKS cluster."
}

# Variables from networking module
variable "resource_group_name" {
  type        = string
  description = "The name of the Azure Resource Group for networking resources."
}

variable "vnet_id" {
  type        = string
  description = "The ID of the Virtual Network where the AKS cluster is deployed."
}

variable "control_plane_subnet_id" {
  type        = string
  description = "The ID of the subnet for the AKS cluster control plane."
}

variable "worker_node_subnet_id" {
  type        = string
  description = "The ID of the subnet for the AKS cluster worker nodes."
}




