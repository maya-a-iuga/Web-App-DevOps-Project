resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  location            = var.cluster_location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  service_principal {
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_secret
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
  }
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
