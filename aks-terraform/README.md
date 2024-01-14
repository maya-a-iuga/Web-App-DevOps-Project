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

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5000`. Here you will be meet with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

- **Iac**

1. **Initialize Terraform Project**

Created a project directory named aks-terraform.
Initialized Terraform using terraform init within this directory.  

2. **Create Modules Directory**
Established a modular structure with two modules: networking-module and aks-cluster-module.
Created directories for each module within the aks-terraform project.

3. **Networking Module Configuration**
   
- variables.tf (Networking Module)
  
Defined input variables:
resource_group_name: Name of the Azure Resource Group.
location: Azure region for deploying resources.
vnet_address_space: Address space for the VNet.  

- main.tf (Networking Module)

Configured essential Azure networking resources:
Resource Group: Created using the resource_group_name variable.
Virtual Network (VNet): Named aks-vnet.
Subnets: Created two subnets - control-plane-subnet and worker-node-subnet.
Network Security Group (NSG): Named aks-nsg with two inbound rules:
kube-apiserver-rule: To allow traffic to kube-apiserver.
ssh-rule: To allow SSH traffic (using 0.0.0.0/0 for wide access, marked with a cautionary comment).  

- outputs.tf (Networking Module)
  
Defined output variables to expose necessary information for other modules:
vnet_id: ID of the created VNet.
control_plane_subnet_id: ID of the control plane subnet.
worker_node_subnet_id: ID of the worker node subnet.
networking_resource_group_name: Name of the created resource group.
aks_nsg_id: ID of the created NSG.

4. **Terraform Execution**
Executed terraform init within the networking-module directory to initialize the module.

## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))
- C.Ugorji

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
