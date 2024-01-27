variable "service_principal_client_id" {
  description = "Client ID for the service principal associated with the cluster."
  default     = "UNKNOWN"
  type        = string
}

variable "service_principal_secret" {
  description = "Client Secret for the service principal."
  default     = "UNKNOWN"
  type        = string
}
