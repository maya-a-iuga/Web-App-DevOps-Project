# input variables

variable "aks_cluster_name" {
  description = "The name of the AKS cluster to be created."
  type        = string
  default     = "aks-cluster"
 }

variable "cluster_location" {
  description  = "Specfies the Azure region where the AKS cluster would be deployed to"
  type         = string
  default      = "UK South"
 }

variable "dns_prefix" {
  description  = "Defines the DNS prefix of cluster"
  type         = string
 }

variable "kubernetes_version" {
  description  = "Specifies which Kubernetes version the cluster would use"
  type         = string
  default      = "1.26.6"
 }

variable "service_principal_client_id" {
  description  = "Provides the Client ID for the service principal associated with cluster"
  type         = string
  default      = "549b492c-2de8-4e83-84fe-d55e63b066bf"
 }

varaible "service_principal_secret" {
  description  = "Supplies the Client secret for the service principal"
  type         = string
  default      = "KHL8Q~a954lzhfeG.Qqut942LABjem28J_cMwdgY"
 }

# Adding the following output variables from networking module as input
# varables.

output "vnet_id" {
  description  = "For storing the id of the previously created vnet"
  value        = azure_resource_group.aks_vnet.name
 }

 output "control_plane_subnet_id" {
   description  = "For storing the ID of the control plane subnet within the Vnet"
   value        = azure_resource_group.aks_vnet.control_plane_subnet.name
 }

output "worker_node_subnet_id" {
  description  = "For storing the ID of the worker node subnet within the Vnet"
  value        = azure_resource_group.aks_vnet.worker_node_subnet.name
}

output "networking_resource_group_name" {
  description  = Azure Resource Group where the networking resources were provisioned in."
  value        = var.azure_resource_group.name
 }

output "aks_nsg_id" {
   description  = "store the ID of the Network Security Group (NSG)."
   value        = azure_resource_group.aks-nsg.name
 }
