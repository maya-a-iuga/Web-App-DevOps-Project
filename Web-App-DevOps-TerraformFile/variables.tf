# variables.tf
# client-id to reference env var TF_VAR_client_id 
variable "client_id" {
  description = "Provider Client Id"
  type        = string
  sensitive   = true
  default     = "c2fc7959-d7b4-4f23-827f-fe6c59827bce"
}
# client-secret to reference env var TF_VAR_client_secret
variable "client_secret" {
  description = "Provider Client Secret"
  type        = string
  sensitive   = true
  default     = "Ik98Q~ZObrT3fs_SnHOOJoW~I6II9NkuQ~1W9dx6"
}

# Remove defaults for when env var are defined
# Set env var:
# setx TF_VAR_client_id client_id /m
# setx TF_VAR_client_secret client_secret /m
#
# Check env var set:
# $env:TF_VAR_client_id
#
# To delete env var:
# [Environment]::SetEnvironmentVariable("TF_VAR_user_name", $null, "Machine")

# Integration: networking-module
# variable "resource_group_name" {
#   description = "Name for the networking resource group"
#   type        = string
#   default     = "networking-resource-group"
# }

# variable "location" {
#   description = "Azure region where the project will be deployed to."
#   type        = string
#   default     = "UK South"
# }

# variable "vnet_address_space" {
#   description = "The address space for the AKS deployment."
#   type        = list(string)
#   default     = ["10.0.0.0/16"]
# }

# Integration: aks-cluster-module
# variable "cluster_name" {
#   description = "Variable that represents the name of the AKS cluster"
#   type        = string
#   default     = "terraform-aks-cluster"
# }

# variable "location" {
#   description = "Azure region where the AKS cluster will be deployed"
#   type        = string
#   default     = "UK South"
# }

# variable "dns_prefix" {
#   description = "DNS prefix of the AKS cluster"
#   type        = string
#   default     = "myaks-project"
# }

# variable "kubernetes_version" {
#   description = "Kubernetes version used by the AKS cluster"
#   type        = string
#   default     = "1.27.7"
# }

# variable "service_principal_client_id" {
#   description = "Client ID (appId) for the service principal associated with AKS cluster"
#   type        = string
#   default     = "c2fc7959-d7b4-4f23-827f-fe6c59827bce"
# }

# variable "service_principal_secret" {
#   description = "Client Secret (password) for the service principal of the AKS cluster"
#   type        = string
#   default     = "Ik98Q~ZObrT3fs_SnHOOJoW~I6II9NkuQ~1W9dx6"
# }

# # Input variables which are output variables from the networking module
# variable "resource_group_name" {
#   description = "The name of the Azure Resource Group where the AKS cluster resources will be deployed"
#   type        = string
# }

# variable "vnet_id" {
#   description = "Vnet on which to run the AKS cluster"
#   type        = string
# }

# variable "control_plane_subnet_id" {
#   description = "Subnet for the control plane"
#   type        = string
# }

# variable "worker_node_subnet_id" {
#   description = "Subnet for the worker nodes"
#   type        = string
#   default     = module.networing-module.worker_node_subnet_id
# }

# variable "aks_nsg_id" {
#   description = "NSG for the AKS cluster Vnet"
#   type        = string
#   default     = module.networing-module.aks_nsg_id
# }


