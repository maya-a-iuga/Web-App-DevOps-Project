# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

This project was forked from maya-a-iuga/Web-App-DevOps-Project. The parent repo contained all the code for the app EXPLAIN THE ADDITIONS YOU HAVE MADE!!!



## Table of Contents

- [Features](#features)
- [Unmerged Features](#unmerged-features)
- [Getting Started](#getting-started)
- [Containerisation](#containerisation)
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

## Unmerged Features

### New Feature Branch - delivery date

On branch, feature/add-delivery-date, I have added a new feature which allows delivery date information to be added to the form, and then displayed within the table. This was achieved by updating the app.py and orders.html files.

Having created this new feature on said new branch, it has been decided that this feature is not necessary; therefore a pull request has not been made to merge this feature into the main branch. 

However, the described feature is avaiable on said branch. !!! And as the orders.html and app.py files have not been changed as the main branch has progressed, a 3-way merge is possible at a later point in time should this feature be needed.

## Containerisation

### Steps for containerisation of the application

The image was created using a dockerfile within the root of the repository (Dockerfile).

- The parent image used was python:3.8-slim, an official python runtime (see From command)
- The working directory was set in the container, and all applications within the working directory were copied into the container (see Workdir and Copy commands)
- System dependencies and ODBC driver were installed (see first Run command)
- Pip and setup tools were installed (see second Run command)
- Packages specified in requirements.txt were installed (see third Run command)
- Port 5000 was exposed (see Expose command)
- Start up command was set to run app.py using python executable (see CMD command)

### Commands used to build image and run container

- The docker image was built and tagged as ‘tm_web_app_image’ using the comman: docker build -t tm_web_app_image .
- The docker container was run locally for testing purposes using the command: docker run -p 5000:5000 tm_web_app_image
- The image was tagged using the command: docker tag tm_web_app_image tmoule/tm_web_app_image:latest
- The image was pushed to docker hub using the command:docker push

### Accessing docker image
- The image is available on docker hub as tmoule/tm_web_app_image
- It can be run using the command: docker run -p 5000:5000 tmoule/tm_web_app_image

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))
- [Tom Moule](https://github.com/Tom-Moule)

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
