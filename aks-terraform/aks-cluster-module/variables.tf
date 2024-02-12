 variable "aks_cluster_name" {
  default = "aks-cluster"
  type = string
  description = "name of AKS cluster"
}

variable "cluster_location" {
  default = "UK South"
  type = string
  description = "location of AKS cluster"
}

variable "dns_prefix" {
  default = "myakscluster"
  type = string
  description = "the DNS prefic of cluster"
}

variable "kubernetes_version" {
  default = "1.28"
  type = string
  description = "version of kubernetes used for AKS cluster"
}

variable "service_principal_client_id" {
  default = ""
  type = string
  description = ""
}

variable "service_principal_client_secret" {
  default = ""
  type = string
  description = ""
}

variable "resource_group_name" {
  default = ""

}


variable "vnet_id" {
  default = ""
  type = string
}

variable "control_plane_subnet_id" {
  default = ""
  type = string

}

variable"worker_node_subnet_id" {
  default = ""
  type = string
}

variable "aks_nsg_id" {
  default = ""
  type = string

}
