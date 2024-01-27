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
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

# Resource group for AKS
resource "azurerm_resource_group" "aks_networking" {
  name     = var.resource_group_name
  location = var.location
}

# VNet for AKS
resource "azurerm_virtual_network" "aks_vnet" {
  name                = "aks-vnet"
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.vnet_address_space
}

# Subnet for AKS control pane
resource "azurerm_subnet" "control_plane_subnet" {
  name                 = "control-plane-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = var.vnet_address_space
}

# Subnet for AKS worker node
resource "azurerm_subnet" "worker_node_subnet" {
  name                 = "worker-node-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = var.vnet_address_space
}

# Network Security Group
resource "azurerm_network_security_group" "aks-ng" {
  name                = "aks_ng"
  resource_group_name = var.resource_group_name
  location            = var.location
}

# NSG inbound rule for traffic to AKS server
resource "azurerm_network_security_rule" "kube_apiserver_rule" {
  name                        = "kube-apiserver-rule"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "86.10.213.84"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_resource_group.aks_networking.name

}

# NSG inbound rule for SSH traffic
resource "azurerm_network_security_rule" "ssh_rule" {
  name                        = "ssh-rule"
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "86.10.213.84"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_resource_group.aks_networking.name
}
