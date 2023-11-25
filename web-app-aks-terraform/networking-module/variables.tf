variable "resource_group_name" {
    description = "The name of the Azure resource group."
    type = string
    default     = "web-app-aks-terraform"
}

variable "location" {
  description = "The Azure region in which to create the resources."
  type        = string
  default     = "UK South"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network (VNet)."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "public_ip_address" {
  description = "The public IP address allowed for inbound rules."
  type        = string
}