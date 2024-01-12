# aks-cluster-module/variables.tf

variable "aks_cluster_name" {
  description = "Variable that represents the name of the AKS cluster"
  type        = string
  default     = "my-aks-cluster"
}

variable "cluster_location" {
  description = "Azure region where the AKS cluster will be deployed"
  type        = string
  default     = "UK South"
}

variable "dns_prefix" {
  description = "DNS prefix of the AKS cluster"
  type        = string
  default     = "myaks-project"
}

variable "kubernetes_version" {
  description = "Kubernetes version used by the AKS cluster"
  type        = string
  default     = "1.27.7"
}

variable "service_principal_client_id" {
  description = "Client ID (appId) for the service principal associated with AKS cluster"
  type        = string
  default     = "c2fc7959-d7b4-4f23-827f-fe6c59827bce"
}

variable "service_principal_secret" {
  description = "Client Secret (password) for the service principal of the AKS cluster"
  type        = string
  default     = "Ik98Q~ZObrT3fs_SnHOOJoW~I6II9NkuQ~1W9dx6"
}

# Input variables which are output variables from the networking module
variable "resource_group_name" {
  description = "The name of the Azure Resource Group where the AKS cluster resources will be deployed"
  type        = string
}

variable "vnet_id" {
  description = "Vnet on which to run the AKS cluster"
  type        = string
}

variable "control_plane_subnet_id" {
  description = "Subnet for the control plane"
  type        = string
}

variable "worker_node_subnet_id" {
  description = "Subnet for the worker nodes"
  type        = string
  # default     = module.networing-module.worker_node_subnet_id
}

variable "aks_nsg_id" {
  description = "NSG for the AKS cluster Vnet"
  type        = string
  # default     = module.networing-module.worker_node_subnet_id
}

