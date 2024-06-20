variable "resource_group_name" {
  description = "The Azure resource group where the networking resources will be created in"
  type        = string
  default     = "azure-devops-project-resource-group"

}

variable "location" {
  description = "The Azure region where the networking resources will be deployed."
  type        = string
  default     = "UK South"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network (VNet)."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
