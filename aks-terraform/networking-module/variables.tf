variable "resource_group_name" {
  description = "this is the name of the resource group"
  type = string
  default = "my-resource-group"  #can be updated depending on what terraform env is in use
}

variable "location" {
  description = "this will be the location for the previsoned resources"
  type = string
  default = "UK South"
}

variable "vnet_address_space" {
  description = "this is the default address space for the VNet"
  type = list(string)
  default = ["10.0.0.0/16"]
}
