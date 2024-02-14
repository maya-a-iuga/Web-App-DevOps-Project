variable "cluster_name" {
    description = "The name of the AKS cluster"
    type = string
    default = "aks-cluster"
}

variable "cluster_location" {
    description = "The Azure Region of the AKS cluster"
    type = string
    default = "UK South"
}

variable "dns_prefix" {
    description = "DNS prefix of the AKS cluster"
    type = string
    default = "value"
}

variable "kubernetes_version" {
    description = "Kubernetes version of the AKS cluster"
    type = string
    default = "value"  
}

variable "service_principal_client_id" {
    description = "Client ID of the service principal of the AKS cluster"
    type = string
    default = "value"  
}

variable "service_principal_client_secret" {
    description = "Client Secret of the service principal"
    type = string
    default = "value"  
}

variable "resource_group_name" {
    description = "Resource Group Name in Azure"
    type = string
    default = "aks-resources"
}

variable "vnet_id" {
    description = "ID of the previously created VNet"
    type = string
    default = "aks-vnet"
}

variable "control_plane_subnet_id" {
    description = "ID of the control plane subnet within the VNet"
    type = string
    default = "control-plane-subnet"
}

variable "worker_node_subnet_id" {
    description = "ID of the worker node subnet within the VNet"
    type = string
    default = "worker-node-subnet"
}
