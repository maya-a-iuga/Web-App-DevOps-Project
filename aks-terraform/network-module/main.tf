resource "azure_resource_group" "aks-resources" {
    name = var.resource_group_name
    location = "UK South"
}

resource "virtual_network" "aks-vnet" {
    name = "aks-vnet"
    address_space = ["10.0.0.0/16"]
}

resource "control_plane_subnet" "control-plane-subnet"{
    name = "control-plane-subnet"
    virtual_network_name = virtual_network.aks_net.name

}
resource "worker_node_subnet" "worker-node-subnet" {
    name = "worker-node-subnet"
    virtual_network_name = virtual_network.aks-vnet.name
    address_prefixes = ["10.0.1.0/24"]

}

resource "network_security_group" "aks-nsg" {
    name = "aks-nsg"
    resource_group_name = var.resource_group_name
    location = var.location
}

resource "network_security_rule" "kube-apiserver-rule" {
    name = "kube-apiserver-rule"
    resource_group_name = "var.resource_group_name"
    networking_security_group_name = network_security_group.aks_nsg.name
    priority = 1001
    direction = "Inbound"
    access = "Allow"
    protocol = "TCP"
    source_port_range = "*"
    destination_port_range = "80"
    source_address_prefix = "*"
    destination_address_prefix = "*"

}

resource "network_security_rule" "ssh-rule" {
    name = "ssh-rule"
    resource_group_name = "var.resource_group_name"
    network_security_group_name = network_security_group.aks_nsg.name
    priority = 1002
    direction = "Inbound"
    access = Allow
    protocol = "TCP"
    source_port_range = "*"
    destination_port_range = "80"
    source_address_prefix = "*"
    destination_address_prefix = "*"

}