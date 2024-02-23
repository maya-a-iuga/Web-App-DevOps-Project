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

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with the necessary information.
  
![Screenshot 2023-08-31 at 15 49 26](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.

 ## New 'Delivery Date' Feature

**Overview**<br />
The delivery date feature is a new functionality added to the company's internal application. This feature allows the addition of a new field in the delivery tracking software. Although the feature has been reverted for the time being, its functionality is documented here for potential future reimplementation.

**Purpose**<br />
The delivery date function is intended to improve delivery management within the company's internal application in terms of accuracy and efficiency. Delivery dates can be added to the tracking system to help users better plan and track order fulfilment, leading to improved customer satisfaction and operational effectiveness.

**Backend Integration**<br />
To store delivery dates for orders, a new column called delivery_date has been incorporated in the backend Azure SQL Database.

**Usage**<br />

*End Users*<br />

Adding a Delivery Date to an Order
1.	Navigate to the Add New Order page within the application.
1.	Fill in the necessary order details, including product information and customer details.
1.	Locate the "Delivery Date" field and select or enter the desired delivery date.
1.	Complete the order creation by pressing ‘Add Order’.<br />

Viewing Delivery Date for an Order
1.	Navigate to the Order List page within the application.
1.	Look for the "Delivery Date" field to view the scheduled delivery date for the order.

*Developers*<br />
Database Interaction<br />
When interacting with the backend database, developers should ensure that the delivery_date column is properly handled in SQL queries and data manipulation operations.<br />

**Conclusion**<br />
The delivery date feature enhances the company's internal application by allowing users to track and manage delivery dates for orders efficiently. By following the outlined guidelines, both end users and developers can leverage this functionality effectively to streamline order fulfilment processes and improve overall operational efficiency.


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

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

## New 'Delivery Date' Feature

**Overview**<br />
The delivery date feature is a new functionality added to the company's internal application. This feature allows the addition of a new field in the delivery tracking software. Although the feature has been reverted for the time being, its functionality is documented here for potential future reimplementation.

**Purpose**<br />
The delivery date function is intended to improve delivery management within the company's internal application in terms of accuracy and efficiency. Delivery dates can be added to the tracking system to help users better plan and track order fulfilment, leading to improved customer satisfaction and operational effectiveness.

**Backend Integration**<br />
To store delivery dates for orders, a new column called delivery_date has been incorporated in the backend Azure SQL Database.

**Usage**<br />

*End Users*<br />

Adding a Delivery Date to an Order
1.	Navigate to the Add New Order page within the application.
1.	Fill in the necessary order details, including product information and customer details.
1.	Locate the "Delivery Date" field and select or enter the desired delivery date.
1.	Complete the order creation by pressing ‘Add Order’.<br />

Viewing Delivery Date for an Order
1.	Navigate to the Order List page within the application.
1.	Look for the "Delivery Date" field to view the scheduled delivery date for the order.

*Developers*<br />

Database Interaction<br />
When interacting with the backend database, developers should ensure that the delivery_date column is properly handled in SQL queries and data manipulation operations.<br />

**Conclusion**<br />
The delivery date feature enhances the company's internal application by allowing users to track and manage delivery dates for orders efficiently. By following the outlined guidelines, both end users and developers can leverage this functionality effectively to streamline order fulfilment processes and improve overall operational efficiency.

## Containerization With Docker<br />
**Containerization Process**
1.	Start by creating a Dockerfile 
1.	Next choose an official Python runtime as the parent image. We'll utilise Python:3.8-slim for this application since it's a good choice for a Flask application.
1.	Then set the working directory. Use the WORKDIR instruction to set the working directory in the container. Set it to /app, a commonly used directory for web applications.
1.	Copy the application files. To copy the contents of your local directory into the container's /app directory, use the COPY instruction. This ensures the files and application code are available inside the container.
1.	Install system dependencies and the ODBC driver required for database connectivity. Also, update the package lists (apt-get update) and then install packages (apt-get install). Then download and add the Microsoft GPG key and repository for installing the MS SQL Server ODBC driver. Finally, clean up unnecessary files (apt-get purge, apt-get clean).
1.	Upgrade pip and setuptools to their latest versions using pip. To ensure that the latest versions of these tools are available for installing Python packages.
1.	 Now install the Python packages specified in your requirements.txt file. This file should contain all the packages necessary for running the application successfully.
1.	To make your Flask application accessible from outside the container, specify that port 5000 should be exposed.
1.	Use the CMD instruction to specify the command that runs the file that starts the Flask application when the container launches.

**Docker Commands**
1.	First build the Docker image by running the following command: *docker build -t {name of the image} .*
1.	Run a Docker container locally to ensure the application functions correctly within the containerized environment. Execute the following command: *docker run -p 5000:5000 {name of the image}*. This maps port 5000 from your local machine to the container, enabling access to the containerized application through the web browser at *http://127.0.0.1:5000*.
1.	Tag your Docker image with the relevant information. Specify the image name, version, and Docker Hub repository in the following format: *docker tag {name of the image} {docker-hub-username}/{image-name}:{tag}*
1.	Login into your Docker Hub account and use the docker push command to upload the Docker image to Docker Hub: *docker push {docker-hub-username}/{image-name}:{tag}*
1.	Log in to your Docker Hub account and confirm that your Docker image is listed within your repository. You can test pulling the image from Docker Hub to ensure that it's accessible.

**Docker Image Information**

Name: liban45/test-web-app

Tags: v1

## Defining Networking Services With IaC.
This documentation outlines the process of defining networking services using Infrastructure as Code (IaC) with Terraform. This is done to deploy a containerized application on a Kubernetes cluster (to ensure the application's scalability). The focus will be on provisioning Azure networking services for the Azure Kubernetes Service (AKS) cluster. We will detail the steps for defining and provisioning the networking module.

1. **Initialize your Terraform project** with the name *aks-terraform*. Organize the project into two modules: *networking-module* and *aks-cluster-module*.
1. **Define input variables**: inside the *networking-module* directory, create a *variables.tf* file to define input variables for the module. These variables include resource_group_name, location, and vnet_address_space.
1. **Define Networking Resources**: In the *networking-module* directory, create a *main.tf* file to define essential networking resources. These resources include Azure Resource Group, Virtual Network (VNet), Control Plane Subnet, Worker Node Subnet, and Network Security Group (NSG).
1. **Define NSG Inbound Rules**: Add rules to the Network Security Group (NSG) to allow traffic to kube-apiserver and SSH from your public IP address. These rules are crucial for the successful provisioning of the AKS cluster and ensuring its security.
1. **Define Output Variables**: Create an *outputs.tf* file to define output variables for the networking module. These variables include vnet_id, control_plane_subnet_id, worker_node_subnet_id, networking_resource_group_name, and aks_nsg_id.
1.**Initialize the Networking Module**: In the *networking-module* run the terraform initialization command. This initializes the networking module, making it ready for use within the main project.

Dependencies ensure that resources are provisioned in the right order within the networking module. The Azure Resource Group (RG) is the parent resource,  whereas the Virtual Network (VNet) depends on the RG for deployment location. As the Control Plane and Worker Node Subnets are sub-resources they depend on the VNet. The Network Security Group (NSG) relies on the RG for deployment location and implicitly on the creation of subnets within the VNet. The NSG's presence is a requirement for NSG Inbound Rules. These requirements guarantee consecutive provisioning, which is necessary for the AKS cluster's networking services to be configured correctly.


## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
