variable "resource_group_name" {
  type        = string
  description = "The name of the Azure Resource Group for networking resources."
  default     = "default-rg"
}

variable "location" {
  type        = string
  description = "The Azure region where the networking resources will be deployed."
  default     = "UK South"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The address space for the Virtual Network."
  default     = ["10.0.0.0/16"]
}

