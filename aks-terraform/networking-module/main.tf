resource "azurerm_resource_group" "aks_group" {
    name = "aks-grp-resources"
    location = "UK South"
}

resource "azurerm_virtual_network" "aks_vnet" {
    name = "aks-vnet"
    location = var.location
    resource_group_name = var.resource_group_name
    address_space = var.vnet_address_space
}

resource "azurerm_subnet" "control_plane_subnet" {
    name = "control-plane-subnet"
    resource_group_name = azurerm_resource_group.aks_group.name
    virtual_network_name = azurerm_virtual_network.aks_vnet.name
    address_prefixes = ["10.1.0/24"]
}

resource "azurerm_subnet" "worker_node" {
    name = "worker-node-subnet"
    resource_group_name = azurerm_resource_group.aks_group.name
    virtual_network_name = azurerm_virtual_network.aks_vnet.name
    address_prefixes = ["10.2.0/24"]
}

resource "azurerm_network_security_group" "aks_nsg" {
    name = "aks-nsg"
    location = azurerm_resource_group.aks_group.location
    resource_group_name = azurerm_resource_group.aks_group.name 

 security_rule {
    name                        = "kube-apiserver-rule"
    priority                    = 1001
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "443"
    source_address_prefix       = "2603:1020:702:3::21"  # Replace with your public IP or IP range
    destination_address_prefix  = "*"
}
 security_rule {
    name                        = "ssh-rule"
    priority                    = 1002
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "2603:1020:702:3::21"  # Replace with your public IP or IP range
    destination_address_prefix  = "*"
}
 }
   