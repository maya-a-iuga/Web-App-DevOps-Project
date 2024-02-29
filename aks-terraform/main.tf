terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.93.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = "4f7ea576-9796-4381-8a3d-c19faee37af0"
  tenant_id       = "47d4542c-f112-47f4-92c7-a838d8a5e8ef"
}


module "networking" {
  source = "./networking-module"

  resource_group_name = "networking-resource-groupp"
  location           = "UK South"
  vnet_address_space = ["10.0.0.0/16"]

}

module "aks_cluster" {
  source = "./aks-cluster-module"

  aks_cluster_name           = "terraform-aks-cluster"
  cluster_location           = "UK South"
  dns_prefix                 = "myaks-project"
  kubernetes_version         = "1.27.7"  
  service_principal_client_id = var.client_id
  service_principal_secret = var.client_secret

  # Input variables referencing outputs from the networking module
  resource_group_name         = module.networking.resource_group_name
  vnet_id                     = module.networking.vnet_id
  control_plane_subnet_id     = module.networking.control_plane_subnet_id
  worker_node_subnet_id       = module.networking.worker_node_subnet_id
  aks_nsg_id                  = module.networking.aks_nsg_id
}