variable "client_id" {
  description = "Azure service principal client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure service principal client secret"
  type        = string
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure AD tenant ID"
  type        = string
}

variable "public_ip_address" {
  description = "The public IP address allowed for inbound rules."
  type        = string
}