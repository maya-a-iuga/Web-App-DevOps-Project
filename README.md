# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.


## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [CI/CD](#cicd)
- [Contributors](#contributors)
- [License](#license)


## Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
![Screenshot 2023-08-31 at 15 48 48](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/3a3bae88-9224-4755-bf62-567beb7bf692)

- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with necessary information.
  
![Screenshot 2023-08-31 at 15 49 26](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.


## Getting Started

### Prerequisites

For the application to succesfully run, you need to install the following packages:

- flask (version 2.2.2)
- pyodbc (version 4.0.39)
- SQLAlchemy (version 2.0.21)
- werkzeug (version 2.2.3)

### Usage

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5000`. Here you will be meet with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.


## CI/CD

### Assumptions

- You have an Azure account or access to a subscription.
- You have defined a service principal with full access to the relevant subscription.


### Containerisation

The web app is packaged as a docker image, available in my personal public github repo: `asoundmove/aicore-devopsproject-webapp:latest`.

Packaging is currently done manually using `Dockerfile` and `docker build -t aicore-devopsproject-webapp .`.


### IaC

Infrastructure as code is defined in directory `aks-terraform`.

*Work in progress*:

#### Azure network resource definition

Terraform module: `aks-terraform/networking-module`

Input variables:
- resource_group_name:   
  Name of the Azure Resource Group in which we define the network for the WebApp

- network_security_group_name:   
  Name of the Azure Network Security Group

- location:   
  Region in which to define resources

- kubectl_ip:   
  Public IP address of the host of kubectl

- vnet_address_space:   
  Address space for the WebApp Virtual Network (VNet).

Output variables:
- vnet_id:   
  ID of the Virtual Network (VNet).

- control_plane_subnet_id:   
  ID of the control plane subnet.

- worker_node_subnet_id:   
  ID of the worker node subnet.

- networking_resource_group_name:   
  Name of the Azure Resource Group for networking resources.

- aks_nsg_id:   
  ID of the Network Security Group (NSG) for AKS.

Defines:
- A Resource Group (RG)
- A Virtual Network (VN) `aks-vnet`, to contain all AKS communications
- A Subnet for the AKS control plane, `control_plane_subnet`
- A Subnet for the AKS worker node, `worker_node_subnet`
- A Network Security Group (NSG) for the AKS network
- Two inbound rules to allow `ssh` and `https` in from my dev host, where I can use kubectl


#### AKS cluster definition

Terraform module: `aks-terraform/aks-cluster-module`

Input variables (to define the cluster):
- aks_cluster_name:   Cluster name
- cluster_location:   Region in which to define resources
- dns_prefix
- kubernetes_version
- service_principal_client_id
- service_principal_client_secret

Input variables (output by networking module):
- vnet_id:   
  ID of the Virtual Network (VNet).

- control_plane_subnet_id:   
  ID of the control plane subnet.

- worker_node_subnet_id:   
  ID of the worker node subnet.

- resource_group_name:   
  Name of the Azure Resource Group for networking resources.

Output variables:
- aks_cluster_name:   
  Name of the AKS cluster.

- aks_cluster_id:   
  ID of the AKS cluster.

- aks_kubeconfig:   
  Kubeconfig file for accessing the AKS cluster.

Defines:
- An AKS cluster


#### AKS cluster creation

Terraform root module: `aks-terraform`

Input variables:
- client_id:   
  The Client ID for the Azure Service Principal

- client_secret:   
  The Client secret for the Azure Service Principal

The input variables are set by calling `. secrets.sh` to source the relevant `exports`. The `secrets.sh` file id not tracked by `git`, so as to keep secrets secret. The file template below should be populated with the relevant values:
```
# Service principal
export ARM_CLIENT_ID=""         # appId
export ARM_CLIENT_SECRET=""     # password
export ARM_SUBSCRIPTION_ID=""
export ARM_TENANT_ID=""

export TF_VAR_client_id=$ARM_CLIENT_ID
export TF_VAR_client_secret=$ARM_CLIENT_SECRET
```

The first four are used by the `provider` in `main.tf`, the last two are used as input parameters to the aks cluster module.

The subscription id can be got from `az account list`, take note of `Id`, this is the subscription id.

If creating the Service Principal from the az CLI, use
`az ad sp create-for-rbac --name $APP_NAME --role contributor --scopes /subscriptions/$SUBSCRIPTION_ID`,
which provides the client id (appId), client secret (password) and tenant id.

For `APP_NAME`, I used `apmcWebApp`, store the credentials in a safe place, e.g. a password vault or `secrets.sh`.

Output variables:
- resource_group_name
- aks_cluster_name

Defines:
- An AKS cluster, fully configured, with the relevant networking and security resources.

After running `terraform init` in each of the modules, to create the AKS cluster, run:
```
terraform init
terraform plan
terraform apply
```

If needed, delete `~/.kube/config` (if it is almost empty `az` refuses to merge credentials), then run `az aks get-credentials --resource-group $resource_group_name --name $aks_cluster_name` to merge the Azure credentials, taking care to replace the RG and cluster name with the correct values (as output by `terraform apply`).

This command provides `kubectl` with access to monitor and control the cluster - provided the correct Network Security has been set-up.

`kubectl` can be used to check the status of the cluster, e.g.:
```
kubectl config get-contexts
kubectl get nodes -o wide
kubectl get pods,deployment,services -o wide
```


## Contributors 

- [Maya Iuga](https://github.com/maya-a-iuga), project base
- [Alain Culos](https://github.com/apmcgh), CI/CD, AiCore course project

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
