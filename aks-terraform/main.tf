module "networking_module" {
  source = "./networking-module"
}

module "aks_cluster_module" {
  source = "./aks-cluster-module"

  # Input variables for the AKS cluster module
  aks_cluster_name            = "terraform-aks-cluster"
  cluster_location            = "UK South"
  dns_prefix                  = "myaks-project"
  kubernetes_version          = "1.26.6"
  service_principal_client_id = var.service_principal_client_id
  service_principal_secret    = var.service_principal_secret

  # Input variables referencing outputs from the networking module
  resource_group_name     = networking_module.Output.networking_resource_group_name
  vnet_id                 = networking_module.Output.vnet_id
  control_plane_subnet_id = networking_module.Output.control_plane_subnet_id
  worker_node_subnet_id   = networking_module.Output.worker_node_subnet_id

}
