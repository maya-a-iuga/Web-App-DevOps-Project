terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.89.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

module "networking_module" {
  source = "./networking-module"

  # Input variables for the AKS networking module
  resource_group_name = "networking-resource-group"
  location            = "UK South"
  vnet_address_space  = ["10.0.0.0/16"]
}

module "aks_cluster_module" {
  source = "./aks-cluster-module"

  # Input variables for the AKS cluster module
  aks_cluster_name            = "terraform-aks-cluster"
  cluster_location            = "UK South"
  dns_prefix                  = "myaks-project"
  kubernetes_version          = "1.26.6"
  service_principal_client_id = var.service_principal_client_id
  service_principal_secret    = var.service_principal_secret

  # Input variables referencing outputs from the networking module
  resource_group_name     = module.networking_module.networking_resource_group_name
  vnet_id                 = module.networking_module.vnet_id
  control_plane_subnet_id = module.networking_module.control_plane_subnet_id
  worker_node_subnet_id   = module.networking_module.worker_node_subnet_id
  aks_nsg_id              = module.networking_module.aks_nsg_id

}
