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


## Terraform Project Documentation

**Overview**  

Terraform by HashiCorp is an Infrastructure as Code (IaC) tool used for building, changing, and versioning infrastructure safely and efficiently. It supports various cloud providers like Azure, AWS, and Google Cloud. Terraform uses declarative configuration files that describe the desired state of your infrastructure.

**Key Concepts**  

Infrastructure as Code (IaC): Manage infrastructure using configuration files rather than through manual processes.

Providers: Plugins that interact with APIs of cloud providers, services, or other tools (e.g., Azure, AWS).
Resources: Components of your infrastructure such as virtual networks, compute instances, or higher-level components like DNS records.
Modules: Reusable, encapsulated Terraform configurations for creating sets of resources that are used together.
State: Terraform records information about what infrastructure is created in a state file, allowing for consistent management of resources.
Terraform Workflow
Initialize:

Run terraform init in your project directory.
This command sets up Terraform's working directory, downloads providers, and prepares the backend for state storage.
Writing Configuration:

Define your infrastructure in configuration files (.tf).
Resources, variables, outputs, and provider configurations are declared here.
Planning:

Execute terraform plan.
Terraform reads configuration files and creates an execution plan, detailing what actions it will perform to reach the desired state.
Applying:

Run terraform apply.
Terraform will execute the plan to create, update, or delete resources as per the configuration.
Maintaining State:

Terraform maintains a state file to map resources to the configuration and keep track of metadata.
The state file is critical for Terraform to function correctly and should be handled with care.
Modifying Infrastructure:

Update configuration files as needed.
Rerun terraform plan and terraform apply to implement changes.
Destroying Infrastructure:

To remove all resources managed by Terraform, use terraform destroy.

**Best Practices**  

Version Control: Keep your Terraform configurations in a version control system (like Git).
Modularization: Use modules to organize and reuse code.
Secrets Management: Avoid hardcoding sensitive information. Use environment variables or secret management tools.
Review Plans: Carefully review execution plans before applying changes.







## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))
- C.Ugorji (AI core DevOps Student)

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
