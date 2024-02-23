variable "resource_group_name"{
    description = " The name of the Azure Resource Group where the networking resources will be deployed in"
    type = string
    default = "aks-resources"
}

variable "location"{
    description = "The Azure region where the networking resources will be deployed to"
    type = string
    default = "uk-south"
}

variable "vnet_address_space" {
    description = "specifies the address space for the Virtual Network (VNet)"
    type = list(string)
    default = ["10.0.0.0/16"]
}