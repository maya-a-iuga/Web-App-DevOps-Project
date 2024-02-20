# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Developer Information](#developer-information)
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
- azure-identity
- azure-keyvault-secrets

### Usage

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5000`. Here you will be meet with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

## Developer Inforamtion

- **Future Modifications:**
Any new feature to be added in future will need to modify code in both the app.py and orders.html files. For example, Delivery Date feature can be added by by modifying the order class, @app_route and new_order sections in the app.py. Also Delivery Date will need to be added to the order.html in the table and form elements.

- **Containerization Process:**
Containerization involves:
1. Creating a Docker File where base image, work directory, required libraries and dependencies and necessary commands are listed
1. Building Docker Image using the Docker File
  docker build -t <image-name>
1. Run the Docker Image to test all the features
  docker run -p 5000:5000 <image-name>
1. Tag and Push the image to the Docker Hub
  docker tag <image-name> docker-user-name>/<image-name-in-Docker>:tag
1. Verify the Docker Hub Image by pulling it from the hub
1. Cleanup
  - Romove Containers
  - docker ps -a
  - docker rm <container-id>

  - Remove Images
  - docker images -a
  - docker rmi <image-id>

- **Infrastructure as Code IaC:**
The folder aka-terraform has all the necessary files to provision the resources on the Kubernetes and then to AKS. These details include the following:
- Terraform Modules
- Cluster Module
- Networking Modules
- Input and Output Variables

## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))
- [Muhammad Nadeem Khan]([https://github.com/ndm621](https://github.com/ndm621))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
