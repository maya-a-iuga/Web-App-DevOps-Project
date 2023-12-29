provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "az_pro_rg" {
  name                  = var.resource_group_name
  location              = var.location
}

resource "azurerm_virtual_network" "aks_vnet" {
  name			= "project-vnet"
  address_space		= var.vnet_address_space
  location		= azurerm_resource_group.az_pro_rg.location
  resource_group_name	= azurerm_resource_group.az_pro_rg.name
}

resource "azurerm_subnet" "control_plane_subnet" {
  name 			= "project-control-subnet"
  resource_group_name	= azurerm_resource_group.az_pro_rg.name
  virtual_network_name	= azurerm_virtual_network.aks_vnet.name
  address_prefixes	= ["10.0.1.0/24"]
}

resource "azurerm_subnet" "worker_node_subnet" {
  name			= "project-worker-subnet"
  resource_group_name 	= azurerm_resource_group.az_pro_rg.name
  virtual_network_name	= azurerm_virtual_network.aks_vnet.name
  address_prefixes	= ["10.0.2.0/24"]
}

resource "azurerm_network_security_group" "aks_nsg" {
  name                = "aks_nsg"
  location            = azurerm_resource_group.az_pro_rg.location
  resource_group_name = azurerm_resource_group.az_pro_rg.name
}

resource "azurerm_network_security_rule" "kube_apiserver" {
  name                        = "ank_nsg_rule_1"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "192.168.1.235"  # Replace with your public IP or IP range
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.az_pro_rg.name
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
}

resource "azurerm_network_security_rule" "ssh" {
  name                        = "ank_nsg_rule_2"
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "192.168.1.235"  # Replace with your public IP or IP range
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.az_pro_rg.name
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
}
