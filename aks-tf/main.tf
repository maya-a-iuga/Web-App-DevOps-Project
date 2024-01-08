terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = "21ff725-ed2e-44a1-aacb-8407dc99e887"
  client_secret   = "~Q88Q~3lohHfA1PKB0lGhltcwpX0.hyVQ6_S3cHa"
  subscription_id = "4563fdd1-e2bd-4332-98dc-7facf2d27d5c"
  tenant_id       = "47d4542c-f112-47f4-92c7-a838d8a5e8ef"
}

module "networking" {
  source = "./networking-module"

  resource_group_name = "networking-rg"
  location           = "UK South"
  vnet_address_space = ["10.0.0.0/16"]

}

module "aks_cluster" {
  source = "./aks-cluster-module"
  
  aks_cluster_name           = "terraform-aks-cluster"
  cluster_location           = "UK South"
  dns_prefix                 = "myaks-project"
  kubernetes_version         = "1.26.6"  
  service_principal_client_id = "d21ff725-ed2e-44a1-aacb-8407dc99e887"
  service_principal_client_secret = "~Q88Q~3lohHfA1PKB0lGhltcwpX0.hyVQ6_S3cHa"

  resource_group_name         = module.networking.resource_group_name
  vnet_id                     = module.networking.vnet_id
  control_plane_subnet_id     = module.networking.control_plane_subnet_id
  worker_node_subnet_id       = module.networking.worker_node_subnet_id
  aks_nsg_id                  = module.networking.aks_nsg_id

}