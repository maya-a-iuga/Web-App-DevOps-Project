  resource "azurerm_resource_group" "network" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "aks_vnet" {
  name                = "aks-vnet"
  resource_group_name = azurerm_resource_group.network.name
  location            = var.location
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "control_plane_subnet" {
  name                 = "control-plane-subnet"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.0.1.0/24"]  # Replace with the desired subnet address space
}

resource "azurerm_subnet" "worker_node_subnet" {
  name                 = "worker-node-subnet"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.0.2.0/24"]  # Replace with the desired subnet address space
}

resource "azurerm_network_security_group" "aks_nsg" {
  name                = "aks-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.network.name
}

resource "azurerm_network_security_rule" "kube_apiserver_rule" {
  name                        = "kube-apiserver-rule"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "6443"
  source_address_prefix       = "92.19.71.227/32"  # Replace with your public IP address
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.network.name
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
}

resource "azurerm_network_security_rule" "ssh_rule" {
  name                        = "ssh-rule"
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "92.19.71.227/32"  # Replace with your public IP address
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.network.name
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
}
