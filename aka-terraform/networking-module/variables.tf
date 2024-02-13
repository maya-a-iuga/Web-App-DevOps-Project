variable "resource_group_name" {
    description = "Resource Group Name in Azure"
    type = string
    default = "aks-resources"
}

variable "location" {
    description = "location of account"
    type = string
    default = "UK South"
}

variable "vnet_address_space" {
    description = "Address space for the Virtual Network"
    type = list(string)
    default = ["10.0.0.0/16"]
}