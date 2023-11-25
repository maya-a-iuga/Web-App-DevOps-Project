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

- **Delivery Date Column (Reverted):** A column with information about the delivery date of the orders. The delivery date column is no longer necessary.

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

## Containerisation with Docker

1. **Creating the Dockerfile**

I created a Dockerfile containing the instructions for building the Docker image for this project.
Refer to the [Dockerfile](./Dockerfile) for more detail.

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

- vnet_id
- control_plane_subnet_id 
- worker_node_subnet_id
- networking_resource_group_name
- aks_nsg_id


4. **Initialising Network Module**

```bash
   cd web-app-aks-terraform/networking-module
   terraform init
```

I initialize the networking module to ensure it is ready to use within the main project using the command above.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
