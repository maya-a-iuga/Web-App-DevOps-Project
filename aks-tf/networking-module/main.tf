resource "azurerm_resource_group" "networking" {
  name     = var.resource_group_name
  location = var.location
}


resource "azurerm_network_security_group" "aks-nsg"{
  name                = "aks-nsg"
  location            = azurerm_resource_group.networking.location
  resource_group_name = azurerm_resource_group.networking.name


  security_rule { 
    name = "kube-apiserver-rule" 
    priority = 1001 
    direction = "Inbound" 
    access = "Allow" 
    protocol = "Tcp" 
    source_port_range = "*" 
    destination_port_range = "443" 
    source_address_prefix = "2a02:c7c:30d9:bc00:6c39:8e07:1293:dec7" 
    destination_address_prefix = "*"
  }

 security_rule { 
    name = "ssh-rule" 
    priority = 1002 
    direction = "Inbound" 
    access = "Allow" 
    protocol = "Tcp" 
    source_port_range = "*" 
    destination_port_range = "22" 
    source_address_prefix = "2a02:c7c:30d9:bc00:6c39:8e07:1293:dec7" 
    destination_address_prefix = "*"
  }

}

resource "azurerm_virtual_network" "aks-vnet" {
  name                = "aks-vnet"
  location            = azurerm_resource_group.networking.location
  resource_group_name = azurerm_resource_group.networking.name
  address_space       = var.vnet_address_space

}

resource "azurerm_subnet" "control-plane-subnet" {
  name                 = "control-plane-subnet"
  resource_group_name  = azurerm_resource_group.networking.name
  virtual_network_name = azurerm_virtual_network.aks-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "worker-node-subnet" {
  name                 = "worker-node-subnet"
  resource_group_name  = azurerm_resource_group.networking.name
  virtual_network_name = azurerm_virtual_network.aks-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}