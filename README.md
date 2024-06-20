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

## Contributors

- [Maya Iuga](<[https://github.com/yourusername](https://github.com/maya-a-iuga)>)

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.

## Robin Winters Azure End-to-End DevOps Pipeline Project

1. _delivery-date column:_ delivery_date added to both backend (app.py) and frontend (order.html) files.
2. _removed delivery-date column:_ delivery_date removed from both backend (app.py) and frontend (order.html) files.

### Containerization

1. Dockerfile created based on python:3.8-slim
2. Docker image builded.
   **imagename:** web-app-image
   **imagetag:** 1.0
3. Image pushed to Docker Hub

- Image can be seen from the link below
- https://hub.docker.com/repository/docker/robinwinters/web-app-image/general

### Networking Services Deployment with Terraform

#### Overview

This repository contains Terraform configurations for deploying networking resources in Azure, including a Virtual Network (VNet), subnets, and Network Security Groups (NSGs). This README provides an overview of the networking services deployed using Infrastructure as Code (IaC) with Terraform.

#### Prerequisites

Before running the Terraform configurations, ensure you have the following prerequisites set up:

Azure subscription
Azure CLI installed and configured
Terraform CLI installed

#### Terraform Configuration

1. Input Variables

   - resource_group_name: The name of the Azure resource group where networking resources will be created.
   - location: The Azure region where networking resources will be deployed.
   - vnet_address_space: The address space for the Virtual Network (VNet).

2. Networking Resources

   - Azure Resource Group
   - Virtual Network (VNet)
   - Subnets
   - Network Security Group (NSG)

3. Output Variables
   - vnet_id: ID of the Virtual Network (VNet).
   - control_plane_subnet_id: ID of the control plane subnet.
   - worker_node_subnet_id: ID of the worker node subnet.
   - resource_group_name: Name of the Azure Resource Group for networking resources.
   - aks_nsg_id: ID of the Network Security Group (NSG) for AKS.

#### Usage

1. Clone Repository: Clone this repository to your local machine.
2. Set Terraform Variables: Update the variables.tf file with your desired values for input variables.
3. Initialize Terraform: Run terraform init to initialize the Terraform configuration.
4. Review Execution Plan: Run terraform plan to review the execution plan and ensure it matches your expectations.
5. Apply Terraform Changes: Run terraform apply to apply the Terraform changes and deploy networking resources to Azure.

- \*\*git can only support files of a certain size & that the .terraform is larger so has to be avoided
