# 1. Azure Resource Group
# Azure Resource Group: Name this resource by referencing the resource_group_name variable created earlier

resource "azurerm_resource_group" "aks_networking" {
  name = var.resource_group_name
  location = var.location
}

# 2. A VNet
# Name the Virtual Network (VNet): aks-vnet

resource "azurerm_virtual_network" "aks-vnet" {
  name                = "aks-vnet"
  location            = azurerm_resource_group.aks_networking.location
  resource_group_name = azurerm_resource_group.aks_networking.name
  address_space       = var.vnet_address_space
}

# 3. Two subnets (for the control plane and worker nodes) 
# Name the Control Plane Subnet: control-plane-subnet

resource "azurerm_subnet" "control-plane-subnet" {
  name                 = "control-plane-subnet"
  resource_group_name  = azurerm_resource_group.aks_networking.name
  virtual_network_name = azurerm_virtual_network.aks-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}


# Name the Worker Node Subnet: worker-node-subnet
  
resource "azurerm_subnet" "worker-node-subnet" {
  name                 = "worker-node-subnet"
  resource_group_name  = azurerm_resource_group.aks_networking.name
  virtual_network_name = azurerm_virtual_network.aks-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# 4. Network Security Group (NSG).
# Name the Network Security Group (NSG): aks-nsg

resource "azurerm_network_security_group" "aks-nsg" {
  name                = "aks-nsg"
  location            = azurerm_resource_group.aks_networking.location
  resource_group_name = azurerm_resource_group.aks_networking.name
}

# Allow inbound traffic to kube-apiserver (TCP/443) from your public IP address
resource "azurerm_network_security_rule" "kube_apiserver" {
  name                        = "kube-apiserver-rule"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "77.98.31.167"  
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.aks_networking.name
  network_security_group_name = azurerm_network_security_group.aks-nsg.name
}

# Allow inbound traffic for SSH (TCP/22) from your public IP address
resource "azurerm_network_security_rule" "ssh" {
  name                        = "ssh-rule"
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "77.98.31.167"  
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.aks_networking.name
  network_security_group_name = azurerm_network_security_group.aks-nsg.name
}