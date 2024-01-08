variable "resource_group_name" {
  description = "a variable for setting the name of the resource group"
  type        = string
  default     = "rg"
}  

variable "location" {
  description = "a variable for setting location of resources"
  type        = string
  default     = "UK South"
}

variable "vnet_address_space" {
  description = "A list of addresses within address space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}