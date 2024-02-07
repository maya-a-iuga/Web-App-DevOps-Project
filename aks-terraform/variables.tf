variable "subscription_id" {
  description = "Subscription ID for Azure."
  type        = string
  sensitive   = false
}

variable "tenant_id" {
  description = "Tenant ID for Azure user."
  type        = string
  sensitive   = false
}

variable "client_id" {
  description = "Client ID (application ID) for the service principal associated with the cluster."
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Client Secret for the service principal."
  type        = string
  sensitive   = true
}

variable "service_principal_client_id" {
  description = "Service principal ID (Object ID) for the service principal associated with the cluster."
  type        = string
  sensitive   = true
}

variable "service_principal_secret" {
  description = "Client Secret for the service principal."
  type        = string
  sensitive   = true
}
