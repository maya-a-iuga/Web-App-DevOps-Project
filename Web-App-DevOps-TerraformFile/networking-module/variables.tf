# networking-module/variables.tf

variable "resource_group_name" {
  description = "The name of the Azure Resource Group where the networking resources will be deployed in."
  type        = string
  default     = "aks-rg"
}

variable "location" {
  description = "Azure region where the networking resources will be deployed to."
  type        = string
  default     = "UK South"
}

variable "vnet_address_space" {
  description = "The address space for the Virtual Network (VNet)."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
