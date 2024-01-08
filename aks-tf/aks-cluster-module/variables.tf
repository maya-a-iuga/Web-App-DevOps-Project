variable "aks_cluster_name" {
  description = "represents the name of the AKS cluster"
  type = string
  default = "AKS-Terraform"
}

variable "cluster_location" {
  description = "Specifies the Azure region where the AKS cluster will be deployed to"
  type = string
  default = "UK South"
}

variable "dns_prefix" {
  description = "Defines the DNS prefix of cluster"
  type = string
  default = "tm-devops-project"
}

variable "kubernetes_version" {
  description = "specifies which Kubernetes version the cluster will use"
  type = string
  default = "1.26.6"
}
variable "service_principal_client_id" {
  description = "provides the Client ID for the service principal associated with the cluster"
  type = string
  default = "d21ff725-ed2e-44a1-aacb-8407dc99e887"
}

variable "service_principal_secret" {
  description = "supplies the Client Secret for the service principal"
  type = string
  default = "~Q88Q~3lohHfA1PKB0lGhltcwpX0.hyVQ6_S3cHa"
}

variable "resource_group_name" {
  description = "specifices name of resource group"
  type = string 
}

variable "vnet_id" {
  description = "specifices the id of the vnet"
  type = string 
}

variable "control_plane_subnet_id" {
  description = "specifices the id of the controle plane subnet"
  type = string 
}

variable "worker_node_subnet_id" {
  description = "specifices the id of the worker node subnet"
  type = string 
}