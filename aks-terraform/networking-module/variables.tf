variable "resource_group_name" {
  description = "Name of the resource group for AKS provisioning."
  default     = "aks_resource_group"
  type        = string
}

variable "location" {
  description = "Azure region where AKS will be deployed."
  default     = "UK South"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for AKS virtual network."
  default     = ["10.0.0.0/16"]
  type        = list(string)
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
