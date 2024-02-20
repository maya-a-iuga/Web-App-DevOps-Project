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
}

# 1. Define the Azure resource group resource
resource "azurerm_resource_group" "aks" {
  name     = var.resource_group_name
  location = "UK South"
}

# 2. Define Virtual Network (VNet)
resource "azurerm_virtual_network" "aks_vnet" {
  name                = "aks-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  depends_on = [ azurerm_resource_group.aks ]
}

resource "azurerm_subnet" "control_plane_subnet" {
  name                 = "control-plane-subnet"
  resource_group_name  = azurerm_resource_group.aks.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "worker_node_subnet" {
  name                 = "worker-node-subnet"
  resource_group_name  = azurerm_resource_group.aks.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_security_group" "aks_nsg" {
  name                = "aks-nsg"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
}

resource "azurerm_network_security_rule" "kube_apiserver_rule" {
  name                        = "kube-apiserver"
  resource_group_name         = azurerm_resource_group.aks.name
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "6443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "ssh_rule" {
  name                        = "ssh  "
  resource_group_name         = azurerm_resource_group.aks.name
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}
