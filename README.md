m# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Contributors](#contributors)
- [License](#license)

## Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
![Screenshot 2023-08-31 at 15 48 48](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/3a3bae88-9224-4755-bf62-567beb7bf692)

- **Delivery Date Column (Reverted):** A column with information about the delivery date of the orders. The delivery date column is no longer necessary.

- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with the necessary information.
  
![Screenshot 2023-08-31 at 15 49 26](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.

## Getting Started

### Prerequisites

For the application to successfully run, you need to install the following packages:

- flask (version 2.2.2)
- pyodbc (version 4.0.39)
- SQLAlchemy (version 2.0.21)
- werkzeug (version 2.2.3)

### Usage

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5000`. Here you will be met with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Containerisation with Docker

1. **Creating the Dockerfile**

I created a Dockerfile containing the instructions for building the Docker image for this project.
Refer to the [Dockerfile](./Dockerfile) for more details.

2. **Building Docker Image**
```bash
docker build -t web-app-devops-project .
```
Using the created Dockerfile, I built the Docker image using the command above in the same directory as the Dockerfile.

3. **Tagging Docker Image**

```bash
docker tag web-app-devops-project jasongrg1/web-app-devops-project:1.0
```
I then tagged the created docker image with my username and an appropriate version tag.

4. **Pushing to Docker Hub**

```bash
docker push jasongrg1/web-app-devops-project:1.0
```
I then uploaded the tagged Docker image to Docker Hub.

5. **Pull image from Docker Hub**

```bash
docker pull jasongrg1/web-app-devops-project:1.0
```
The Docker image can now be pulled from Docker Hub and is accessible.
```bash
docker run -p 5000:5000 web-app-devops-project:1.0
```
The container is ran using the command above. The -p flag is used to map port 5000 from the local machine to port 5000 in the container. The application works as expected within the containerized environment. The URL http://127.0.0.1:5000 is used to interact with the application.

## Defining Networking Services with IaC

- `web-app-aks-terraform/`
  - `aks-cluster-module/`
  - `networking-module/`
    - `main.tf`
    - `outputs.tf`
    - `variables.tf`

1. **Defining Input Variables**

The following input variables are defined inside the variables.tf configuration file:
- resource_group_name: The name of the Azure Resource Group where the networking resources will be deployed in.
- location: The Azure region where the networking resources will be deployed to.
- vnet_address_space: The address space for the virtual network.

2. **Defining Networking Resources and Network Security Group (NSG) rules**

These resources are defined inside the main.tf configuration file:

- Azure Resource Group - groups resources related to the web application.
- Virtual Network (VNet) - isolated network that allows you to organize and control communication between Azure resources.
- Control Plane Subnet - subnet designated for the control plane of the Azure Kubernetes Service (AKS) cluster. It depends on the existence of the Virtual Network.
- Worker Node Subnet - subnet designated for the worker nodes of the AKS cluster. It depends on the existence of the Virtual Network.
- Network Security Group (NSG) - virtual firewall for controlling network traffic to and from Azure resources. It depends on the existence of the Virtual Network.

Within the NSG, two inbound rules are defined: 
one to allow traffic to the kube-apiserver and the other to allow inbound SSH traffic.

3. **Defining Output Variables**

The following output variables are defined inside the outputs.tf configuration file:

- vnet_id - used within the cluster module to connect the cluster to the defined VNet.
- control_plane_subnet_id - used to specify the subnet where the control plane components of the AKS cluster will be deployed to.
- worker_node_subnet_id - used to specify the subnet where the worker nodes of the AKS cluster will be deployed to.
- networking_resource_group_name - used to ensure the cluster module resources are provisioned within the same resource group.
- aks_nsg_id - used to associate the NSG with the AKS cluster for security rule enforcement and traffic filtering.


4. **Initialising Network Module**

```bash
   cd web-app-aks-terraform/networking-module
   terraform init
```
I initialize the networking module to ensure it is ready to use within the main project using the command above.

## Defining AKS Cluster with IaC

- `web-app-aks-terraform/`
  - `aks-cluster-module/`
    - `main.tf`
    - `outputs.tf`
    - `variables.tf`
  - `networking-module/`

1. **Defining Input Variables**

The following input variables are defined inside the variables.tf configuration file:

- aks_cluster_name - represents the name of the AKS cluster.
- cluster_location - specifies the Azure region where the AKS cluster will be deployed to.
- dns_prefix - defines the DNS prefix of cluster.
- kubernetes_version - specifies which Kubernetes version the cluster will use.
- service_principal_client_id - provides the Client ID for the service principal associated with the cluster.
- service_principal_secret - supplies the Client Secret for the service principal.

Additionally, the output variables from the networking module are added as input variables for this module:

- resource_group_name
- vnet_id
- control_plane_subnet_id
- worker_node_subnet_id

2. **Defining Cluster Resources**

In the main.tf configuration file, there is code for creating an AKS cluster with specified configurations. The input variables defined in variables.tf are used to specify necessary arguments. In addition, configurations 'default_node_pool' and 'service_principal' are used for specific settings within the AKS cluster.


3. **Defining Output Variables**

The following output variables are defined inside the outputs.tf configuration file:
- aks_cluster_name - store the name of the provisioned cluster
- aks_cluster_id - store the ID of the cluster
- aks_kubeconfig - capture the Kubernetes configuration file of the cluster which is needed for interacting with and managing the AKS cluster using kubectl.

4. **Initialising Cluster Module**

```bash
   cd web-app-aks-terraform/aks-cluster-module
   terraform init
```
I initialize the cluster module to ensure it is ready to use within the main project using the command above.

## Creating AKS Cluster with IaC

- `web-app-aks-terraform/`
  - `main.tf`
  - `aks-cluster-module/`
  - `networking-module/`

The cluster is created in the main configuration file.

1. **Provider Setup**

The required provider is called "azurerm" and it is configured with the necessary details to authenticate and interact with Azure resources. These details for identification include:
  - client_id
  - client_secret
  - subscription_id
  - tenant_id

2. **Networking Module Integration**

The networking module is instantiated in the main.tf using the code from [Defining Networking Services with IaC](#defining-networking-services-with-iac). The values needed for the input variable required by the networking module are provided here. The variables include: 

- resource_group_name
- location
- vnet_address_space

3. **Cluster Module Integration**

The cluster module is also instantiated in the main.tf using the code from [Defining AKS Cluster with IaC](#defining-aks-cluster-with-iac). The values needed for the input variable required by the cluster module are provided here. The variables include: 

- aks_cluster_name
- cluster_location
- dns_prefix
- kubernetes_version
- service_principal_client_id
- service_principal_client_secret

There are also input variables referencing outputs from the networking module:
- resource_group_name
- vnet_id
- control_plane_subnet_id
- worker_node_subnet_id
- aks_nsg_id 

## Kubernetes Deployment to AKS 

- **Deployment Manifest**

The application is specified to concurrently run on two replicas within the AKS cluster, allowing for scalability and high availability.
The manifest is configured to point to the docker image created [earlier](#containerisation-with-docker) to house the application. This ensures that the correct container image is utilized for deployment.

- **Service Manifest**

The service is configured to use the TCP protocol on port 80 for internal communication within the cluster. The targetPort is set to 5000, which corresponds to the port exposed by your container.

The service type is set to ClusterIP, designating it as an internal service within the AKS cluster.

- **Deployment Strategy**

The chosen deployment strategy for this project is Rolling Update. This strategy involves updating instances one at a time gradually. During updates, a maximum of one pod deploys while one pod becomes temporarily unavailable. As a result, there is minimal downtime to users making this suitable for the application.

Dealing with issues is straightforward by reverting back to a previous version. Overall, this strategy allows the application's requirement of continuous availability to be met.

- **Testing and Validation**
These are the tests I have conducted to ensure the functionality and reliability of the application.

```bash
kubectl get pods
```
This command is used to check the status of the pods. All the pods should be in the 'Running' state and have no restarts.

```bash
kubectl get svc
```
This command is used to receive information about the services. This can be used to confirm that the services have the correct service type. The ports and IP addresses can also be checked.

```bash
kubectl port-forward <pod-name> 5000:5000
```
This command is used to test connectivity and interact with the application. The AKS cluster can be accessed at http://127.0.0.1:5000 to test functionality.

- **Application Distribution**

I plan to distribute the application to other internal users within my organisation using Helm. This is a Kubernetes package manager that simplifies the deployment and management of Kubernetes applications.

<!-- Describe the steps and mechanisms you would use to make the application accessible to team members. Additionally, discuss how you would share the application with external users if the need arises. Highlight any considerations or additional steps required to provide external access securely. -->



Helm repositories allow organizations to share and distribute Helm charts easily. By packaging applications into Helm charts and hosting them in repositories, teams can ensure consistent deployment practices and share their applications with others, fostering collaboration and knowledge sharing.


## CI/CD Pipeline with Azure DevOps

The pipeline is set up in Azure DevOps, integrating with Docker Hub and Azure Kubernetes Service (AKS).

- **Source Repository**
The source code for the project is hosted on GitHub. The CI/CD pipeline is triggered on each push to the main branch.

``` yaml
trigger:
- main
```

- **Build Pipeline**

The build pipeline uses an Ubuntu-based build agent where the tasks are executed. A Docker task is used to build and push the Docker image to Docker Hub. The task is possible by setting up a service connection between Azure DevOps and the Docker Hub account where the application image is stored. The buildandpush command is used to build and push a new Docker image.

- **Release Pipeline**

The release pipeline deploys the application to AKS using the KubernetesManifest task. It is configured to deploy the application manifest ([application-manifest.yaml](./application-manifest.yaml)) to the specified AKS cluster in the networking resource group. This is done by creating and configuring an AKS service connection within Azure DevOps. The pipeline is modified to incorporate the Deploy to Kubernetes task with the deploy kubectl command. 

- **Validation**

After configuring the CI/CD pipeline, which includes both the build and release components, I test and validate its functionality. It is necessary to validate the effectiveness of the CI/CD pipeline in application deployment.

```bash
kubectl get pods
```
This command is used to check the status of the pods. The pods should be in the 'Running' state. A test I did was changing the number of replicas in the application manifest.
``` yaml
replicas: 3
```
This will change the number of instances of the application changing the number of running pods. This is used to validate that running the pipeline correctly deploys the application manifest.

```bash
kubectl get svc
```
This command is used to receive information about the services. This can be used to confirm that the services have the correct service type. The ports and IP addresses can also be checked.

```bash
kubectl port-forward <pod-name> 5000:5000
```
This command is used to test connectivity and interact with the application. The AKS cluster can be accessed at http://127.0.0.1:5000 to test functionality.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
