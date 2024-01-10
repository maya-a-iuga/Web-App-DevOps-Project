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

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.


# Karl Moody DevOps pipeline milestones
## Milestone 1 - Set up the environment
### Task 1 - Set up GitHub
- Fork the repository, including all branches from https://github.com/maya-a-iuga/Web-App-DevOps-Project.
- Carefully read the README file to familiarise with the web application.
- Ensure the app works and inspect its functionality.
- 
### Task 2 - Set up Azure
- Contact support to receive login credentials for Microsoft Azure.

## Milestone 2 - Version control
### Task 1 - Clone the forked repistory
Use `git clone` to clone the repo from your repository on your gitHub account.
- `git clone https://github.com/<username>/Web-App-DevOps-Project.git`
### Task 2 - Create 'Issue' for the new column
- GitHub doesn't turn on issues by default. So navigate to the repository settings, in the general tab search for issues and check the box.
- On the same bar where the project settings button was found there will be an issues button near the far left of the navigation bar. Select that to view issues and at the top right select the green button 'New issue'.
- Create a new issue and assign it to the appropriate developer, tasking them to create a new column for the order tracking web application. The column will be for the creation of a delivery date within the order tracking web app.
### Task 3 - Create features branch
- Create a new branch on the local repository named `feature/add-delivery-date`.
- Use `git checkout -b feature/add-delivery-date` from the main branch. This will take you from the main branch, copy everything in the main branch and checkout to the new branch. The `-b` flag tells git to run `git branch` before `git checkout`
### Task 4 - Make code changes
- Make code changes to app.py and orders.html to reflect the new column across the web application.
- The changes needed to be made are in the following locations:
    - `app.py`:
        - The class definition for `Order`
        - The function definition for `add_order`
    - `orders.html`:
        - The `div class="tab-container"` needs a table header `th` and a table data `td` for delivery date, inside the `table class="order-table"`.
        - The `div class="content` needs a `label for` and an `input type` for delivery date.
### Task 5 - Push changes to remote branch
- Now the column has been added, push the changes to the remote origin. 
- `git push --set-upstream origin feature/add-delivery-date` will create a new branch on the remote repository on GitHub.
### Task 6 - Create pull request
- Create a pull request to pull the new features branch into the main branch on the forked repository to initiate proceedings to merge the two together.
### Task 7 - Merge pull request
- Review the changes to the code in the new branch
- If there are no conflicts merge them in 
- Delete the branch once its compeleted.
### Task 8 - Revert changes
- Create a new branch `called revert-deliver-date` while in the `main` branch.
- Use `git checkout -b revert-delivery-date`
- Use `git log` to find the commit hash of the change to revert.
- Use `git revert <commit-hash>` to undo the commit
- Push the changes to the remote branch using `git push --set-upstream origin revert-delivery-date`
- Create a pull request and merge the `revert-delivery-date` branch into `main` branch. Approve and merge the pull request.
## Milestone 3 - Containerization with Docker
### Task 1 - Build the Dockerfile
- Build the Dockerfile 
    - FROM - Use an official Python runtime `python:3.8-slim`
    - WORKDIR - Set the working directory in the container `/app`
    - COPY - Copy the application files into the container `. /app`
    - RUN - Install system dependencies and ODBC driver
    - RUN - Install pip and setuptools
    - RUN - Install python packages from the requirements.txt using `pip install --trusted-host pypi.python.org -r requirements.txt`
    - EXPOSE - expose port 5000 on local machine
    - CMD - Startup commands for container
    ### Task 2 - Build the Docker image
- Build the Dockerfile into a Docker image using `docker build -t <name of the image> .`
### Task 3 - Run the Docker container locally
- Use `docker run -d -p 5000:5000 <name of the image>`. The `-d` flag detaches the docker container from the CLI so you can still run docker commands, and `-p` publishes a list of all the containers ports to the host.
- Open a web browser and enter `http://127.0.0.1:5000` to access port 5000 on the local machine to interact with the web application in the container.
- Confirm the appliocation works as intended.
### Task 4 - Tag and push the Docker image to Docker Hub
- Login to docker using the cli with `docker login`
- Use `docker tag <name of the image> <docker-hub-username>/<image-name>:<tag>` to tag the Docker image with the appropriate information.
- Then use `docker push <username>/<name of the image>:<tag>`
### Task 5 - Confirm push was successful
- Login to your Docker Hub account through a web browser to confirm that your docker image was successfully pushed to Docker Hub
- Stop the Docker container on your local system, using `docker stop <name>`. To see the list of all containers use `docker ps -a`. 
- Once stopped, get the Id or the name of the container to delete and then Use `docker rm <name>` or `docker rm <id>` to remove it completely.
- Pull the docker image from docker hub and test that it works as expected. Use `docker pull <username>/<name of the image>:<tag>`.
- Use `docker run -d -p 5000:5000 <username>/<name of the image>` to run the image from Docker Hub and check the image works the same.
- Stop the container and remove the container. 
### Task 6 - Documentation and cleanup
- Delete any containers created during these tasks using the methods in task 5.
- Remove both images from your system using `docker rmi <image id>`. To see a list of images use `docker images`.
