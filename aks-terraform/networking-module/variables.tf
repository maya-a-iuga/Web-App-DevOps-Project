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
