variable "resource_group_name" {
    description="resource group where storage account will be created "
    type = string
} 

variable "location" {
  description = "The Azure region where the Storage Account will be deployed."
  type        = string
  default     = "UK south"
}

variable "vnet_address_space" {
description = "vnet specifies the address space for vnet in main config file "
type = list(string)
}

