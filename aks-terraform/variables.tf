variable "service_principal_client_id" {
  description = "Client ID for the service principal associated with the cluster."
  default     = "6f91d123-0d0e-49f4-a9a3-0573d8ada364"
  type        = string
}

variable "service_principal_secret" {
  description = "Client Secret for the service principal."
  default     = "e564e5ec-94be-4bf6-94b0-6bbceee888cb"
  type        = string
}
