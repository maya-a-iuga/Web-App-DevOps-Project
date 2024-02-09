# Web-App-DevOps-Project

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

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5001`. Here you will be meet with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.

## Containerisation
This app has been developed to be run from a container using Docker. This allows the application to ported and run from any divice that supports docker and also allows for deployment on clooud services and Kubernetes clusters.

### Containerization Process
This web application is a containerised application - designed to be hosted in and run from a docker container. The 'dockerfile' in the repository contains the outline of how to set up and run a container instance of this application. 

This file is specified to run in a MacOS environment using an M1/M2/M3 chip. The WORKDIR defines which folder will be open within the container on start up, while the COPY command defines exactly what will be copied from the repo into the container (and where it will be stored). This can be edited to allow the application to run on different computers and with different base images, however, this application does need to be run using Python.

The RUN commands define exactly what needs to be run and installed on container start up, while EXPORT defines which port to connect to (this must match the port provided in your docker run command once the container has been created and the ports specified in your code - in this instance, it is set to 5001 by default). The RUN commands should not be edited or changed, however, the port can be adjusted as needed. Any adjustments made to the port must be followed up byb updating the port named in script.js and app.py.

Finally, the CMD command specifies what command line argument to run once the container has completed set up, and will initiate the web application from within the container. This should not be edited, except for the prupose of adjusting the file path, if the WORKDIR is changed.

To build a local image instance of this container locally, simply run `docker build -t <name of the image> .` in the comand line, where the full stop references the file path location of the dockerfile.

Once built, to spin up a container instance of the image and run the application, run `docker run -p 5000:5000 <name of the image>` and then navigate to *http://127.0.0.1:5001* to access the web application.

To tag and push the docker image to Docker Hub (where the image can be saved and version controlled by Docker), run `docker tag <name of the image> <docker-hub-username>/<image-name>:<tag>` and then `docker push <docker-hub-username>/<image-name>:<tag>`.

## IAC

Terraform is used to provide infrastructure as code (IAC) to define and provision the necessary cloud resources on Azure to host the web application on a Kubernetes cluster. This Terraform project is split into two modules, one for defining and managing the cluster and the other for the cluster's networking. The file structure can be seen in detail below.

.
├── aks-terraform               # main project folder
    ├── main.tf                 # defines the resources for the module
    ├── outputs.tf          §   # defines the outputs from the provisioning of resources
    ├── variables.tf            # user defined variables to be used in main.tf
    ├── aks-cluster-module
       ├── main.tf
       ├── outputs.tf
       └── variables.tf
    └── networking-module
        ├── main.tf
        ├── outputs.tf
        └── variables.tf

### Networking module
This module defines the cloud network/platform used to host the Kubernetes cluster and subsequent web application on Azure's cloud. for this project we have define the following networking resources:

* **Resource group:** Logical grouping of Azure resources for logging, monitoring, billing and group analytics and control
* **Virtual network:** Cloud-based IP network or platform for the application to run in
* **Subnet:** Subdivision of the IP network for separation of resources whilst maintaining easy communication when needed. Our application defines one for the AKS control pane and the other for worker nodes
* **NSG (Network Security group):** Security boundary for inbound and outbound connection rules between different Azurew resources and different requests and communication attempts from outside the apoplication or network
* **Inbound rules:** Network security rules limiting network traffic to only the minimum our application needs for security purposes. This application holds two inbound rule - meaning only inbound traffic of certain specified types can enter the network. These are SSH and communication ot the kube-apiserver

### AKS clustering module
This module defines the AKS cluster that will be launched to host the wedb application. For this project, the key elements are:

* **AKS cluster:**  The group of machines (nodes) working together to run our containerized application on Azure
* **Node pool:** The default number of nodes in a cluster
* **Service principal:** The authentication required for the network linked with the AKS cluster

### Setting up permissions
When using terraform to create the necessary resources, we need to first log in to the Azure CLI using:
`az login --tenant <azure_tenant> --allow-no-subscriptions`. This will provide us with our SubscriptionId and TenantId required to set up our azurerm provider. The JSON response we get back in our command line will list these under "id" and "tenantId" respectively. Running `az account list --output table` Will show all accounts and their relevant IDs to allow you to check you are using the correct IDs. You may also run `az account set --subscription <subscriptionId>` if you wish to ensure your Azure CLI is referencing the correct account going forward.

We can then run az ad sp create-for-rbac -`-name <choose_name> --role contributor --scopes /subscriptions/{your-subscription-id}` to create a new app registration. This will provide an Application (client) ID and Client Secret required to create the resource group and associated resources using Terraform. After this has been created, you will receive another JSON response to you command line, inclusing the "appId" (Client ID), "password" (Client Secret), "displayName" (the name of your registration) and "tenant" (your tenant ID - you should already have this).

Finally, you can add the following variables to your main.tf file under your azurerm provider block: client_id, client_secret, subscription_id and tenant_id. These should be taken from defined variables in your variables.tf file and can be automatically brought in when running terraform apply via your .zshrc file. This file should include set terraform variables in the following format: `export TF_VAR_variable_name_in_terraform_variables_file="<azure ID or secret>"`. Ensure to run `source .zshrc` after editing the file.

### Creating the resources with Terraform
Once permissions have been created and added to your .zshrc file, you can run `terraform init` in each module and main foolder in terraform to initialise the modules and main file path. Then  run `terraform plan` and finally `terraform apply` to provision the required resources.

Now retrieve the kubeconfig file via: `az aks get-credentials --resource-group <your-resource-group> --name <your-aks-cluster-name>` in the command line. This will return the message `Merged "<aks cluster name>" as current context in /Users/<user name>/.kube/config`. Running `kubectl config get-contexts` will confirm the existence of the cluster locally.

## Kubernetes deployment to AKS
To create and deploy the kubernetes cluster to your provisioned AKS resources on Azure, run `kubectl apply -f <absolute file path to manifest.yaml file>`. To check this has worked and view all pods, run `kubectl get pods -w`. Finally, to access the webapplication, port forward into the application using: `kubectl port-forward flask-app-deployment-67f878f7db-g2z76 5001:5001` and going to this address in your web browser: http://127.0.0.1:5000


### Delivery Date
Allows the specification of a delivery date when adding an order. This ensures that when an order is created, a delivery date can be tagged to the order.
