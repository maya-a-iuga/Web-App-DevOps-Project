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

- **Delivery Date Column:** An additional field is available to capture the Delivery Date of an order. While the feature is currently inactive, it can be activated by merging the changes from the "feature/add-delivery-date" branch into the main branch.

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

### Docker containerization

**1. Dockerfile Creation:**
We utilized an official Python runtime as our parent image, specifically public.ecr.aws/docker/library/python:3.9.10-slim-buster. The working directory in the container was set to /app, and the application files were copied into the container's /app directory.
**2. System Dependencies and ODBC Driver Installation:**
System dependencies and the ODBC driver were installed to support the application. The installation process involved updating the package manager, installing necessary dependencies, and configuring the Microsoft ODBC driver.
**3. Pip and Python Package Installation:**
We upgraded pip and setuptools before installing Python packages specified in the requirements.txt file.
**4. Port Exposure and Startup Command:**
The Dockerfile exposed port 5000, which is the port the Flask application runs on. The startup command was set to launch the Flask application.


**Usage Instructions:**

**Docker Image Name:** nmohamed436/azure-end-to-end-devops
Tags: Latest
Ensure Docker is installed on your system.
Build the image using the provided Dockerfile. docker build -t nmohamed436/azure-end-to-end-devops:latest .
Run the container, exposing port 5000.
Access the application on http://localhost:5000.

**Deployment and Service Manifests:**

Created Deployment and Service manifests in the application-manifest.yaml file.
Deployment defines the desired state for the application pods, including image, ports, and replicas.
Service defines a ClusterIP service for internal communication within the AKS cluster.
**Deployment Strategy:**

Chose a RollingUpdate deployment strategy for its gradual and controlled rollout.
Configured a maximum surge and maximum unavailable percentage to manage the deployment process.
This strategy ensures minimal downtime and allows for easy rollback if issues arise during deployment.
**Testing and Validation:**

Conducted tests to ensure pods are created, containers are running, and the service is accessible.
Validated the application's functionality within the AKS cluster, focusing on critical features.
Monitored pod logs and used kubectl commands to troubleshoot and verify the health of pods.

**Distribution Plan:**

For internal users, no port forwarding is needed; users can access the service within the AKS cluster.
External users will require secure access; consider using Ingress controllers for HTTPS traffic.
Utilize RBAC and Network Policies to control access and enhance security.
Deploy the application in a namespace and control access through proper RBAC configurations.


## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
