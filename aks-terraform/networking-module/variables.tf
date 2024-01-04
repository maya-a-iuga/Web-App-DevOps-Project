variable "resource_group_name" {
  description = "Name of the Azure Resource Group in which we define the network for the WebApp"
  type        = string
  default     = "WebAppRG"
}

variable "network_security_group_name" {
  description = "Name of the Azure Network Security Group"
  type        = string
  default     = "WebAppNSG"
}

variable "location" {
  description = "Region in which to define resources"
  type        = string
  default     = "UK South"
}

variable "kubectl_ip" {
  description = "Public IP address of the host of kubectl"
  type        = string
  default     = "193.164.22.93"
  # curl ipinfo.io/ip
}

variable "vnet_address_space" {
  description = "Address space for the WebApp Virtual Network (VNet)."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}