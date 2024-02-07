# Input variables
variable "aks_cluster_name" {
  description = "Name of the AKS cluster you wish to create."
  type        = string
}

variable "cluster_location" {
  description = "Azure region where the AKS cluster will be deployed to."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix of cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version the cluster will use."
  type        = string
}

variable "service_principal_client_id" {
  description = "Client ID for the service principal associated with the cluster."
  type        = string
}

variable "service_principal_secret" {
  description = "Client Secret for the service principal."
  type        = string
}

variable "subscription_id" {
  description = "Subscription ID for Azure."
  type        = string
  sensitive   = false
}

variable "tenant_id" {
  description = "Tenant ID for Azure user."
  type        = string
  sensitive   = false
}

variable "client_id" {
  description = "Client ID (application ID) for the service principal associated with the cluster."
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Client Secret for the service principal."
  type        = string
  sensitive   = true
}

# Output variables
variable "resource_group_name" {
  description = "Name of the Azure Resource Group where the networking resources will be deployed in."
  type        = string
}

variable "vnet_id" {
  description = "ID of the networking VNet."
  type        = string
}

variable "control_plane_subnet_id" {
  description = "ID of the control plane subnet within the VNet."
  type        = string
}

variable "worker_node_subnet_id" {
  description = "ID of the worker node subnet within the VNet."
  type        = string
}

variable "aks_nsg_id" {
  description = "ID of NSG"
  type        = string
}
