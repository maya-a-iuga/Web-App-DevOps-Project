resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name  # Reference the variable here
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
  name                 = "default"
  vm_size              = "Standard_DS2_v2"
  enable_auto_scaling  = true
  min_count            = 1
  max_count            = 5
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
    Environment = "Development"
  }
}

