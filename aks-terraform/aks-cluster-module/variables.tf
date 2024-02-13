 variable "aks_cluster_name" {
  default = "terraform-aks-cluster"
  type = string
  description = "name of AKS cluster"
}

variable "cluster_location" {
  default = "UK South"
  type = string
  description = "location of AKS cluster"
}

variable "dns_prefix" {
  default = "myaks-project"
  type = string
  description = "the DNS prefic of cluster"
}

variable "kubernetes_version" {
  default = "1.26.6"
  type = string
  description = "version of kubernetes used for AKS cluster"
}

variable "service_principal_client_id" {
 

}

variable "service_principal_client_secret" {
  
  
}

variable "resource_group_name" {


}


variable "vnet_id" {
  

}

variable "control_plane_subnet_id" {
 


}

variable"worker_node_subnet_id" {
  

}

variable "aks_nsg_id" {
 

}
