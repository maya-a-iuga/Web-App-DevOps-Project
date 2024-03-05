variable "resource_group_name" {
    description = "The name of the Azure Resource group"
    type = string
    default = "aks-resource"
}

variable "location" {
    description = "Azure region where the networking resources will be deployed"
    type = string
    default = "UK South"
}

variable "vnet_address_space" {
    description = "Specifies the address space for the virtual network (Vnet)"
    type = list(string)
    default = ["10.0.0.0/16"]
}