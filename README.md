# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Web-App-DevOps-Project](#web-app-devops-project)
  - [Table of Contents](#table-of-contents)
  - [Features](#features)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Usage](#usage)
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

- **Additional feature (delivery date):** It may be possible to add an additonal column for delivery date 

-  
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
- [Samia Mohamed]([https://github.com/yourusername](https://github.com/Samia-A-Mohamed))
  
## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.

## WebApp DevOps Project Documentation 

I have been entrusted with the critical task of building a comprehensive end-to-end DevOps pipeline to support my organization's internal web application, designed to manage and monitor deliveries across the company. 

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/06675e88-f541-4396-9cb7-141303a627ad)

Overall, the end-to-end DevOPs pipeline included the following steps: 
1. Implementing version control by integrating new features into the web application. 
2. Containerization using Docker Images.
3. Infrastructure as Code (IaC) to define and manage resources within Azure using Terraform.
4. Orchestrating the deployment of the containerized application using Kubernetes.
5. Employing CI/CD (Continuous Integration/Continuous Deployment) using Azure DevOps.

**Addition of delivery date column**
An issue was raised regarding the addition of a delivery date column. This was then tackled locally by creating a branch called feature/add-delivery-date where the code changes were made. Commit was made and the changes were pushed to Github. 
A pull request was submitted to merge the code changes from the feature branch into the main branch. Which was then reviewed and approved. It has been determined that the delivery_date column is no longer necessary in the backend database, and so I needed to revert the changes made back. This was done by creating a new branch based from the main branch called revert-delivery-date. I reverted the changes by finding the commit hash of the specific change to revert us using git log or GitHub's commit history. I ran **_git revert COMMIT_HASH_** command to revert the changes and pushed the changes to Github. Finally, a pull request was created, approved and merged on to main branch.
This process ensured version control and shows that new features can be added or removed without it affecting the codebase. 

## **Containerization Process**
**1. Dockerfile was created in the same working directory as the project**

<img width="1148" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/dc2aba8c-4dd0-4727-be0f-47cf301e06be">

This Dockerfile included installing the ODBC driver and necessary dependencies that allow the web application to connect to the Azure SQL Database in the backend, and thus retrieve the orders data.

**2. Docker image is built**

As I had MacOS M2 chip, to build the image, I ran **_docker build -t image_name --no-cache --platform linux/amd64 ._**
But if you are on other Linux OS or windows, you can simply run  **_docker build -t image_name ._**

**3. Run the docker container locally**

Again as I was using MacOS M2 chip, I ran **_docker run -p 5000:5000 --platform linux/amd64 image_name_**
But if you are on other Linux OS or windows, you can simply run  **_docker run -p 5000:5000 image_name_**

****Note: Issues I faced****
* I ran into an error when I built the image and ran the container initially: **docker: Error response from daemon: Ports are not available: exposing port TCP 0.0.0.0:5000 -> 0.0.0.0:0: listen tcp 0.0.0.0:5000: bind: address already in use.**
* To fix this issue, I built another image, changing the app.py file: app.run(host='0.0.0.0', **port=5000**, debug=True) to app.run(host='0.0.0.0', **port=5001**, debug=True) , then the Dockerfile to Expose 5001 instead of 5000. 
* I then ran **_docker run -p 5001:5001 --platform linux/amd64 name of the image_** and this successfully ran. 
* To check that is worked, I opened a web browser and went to http://127.0.0.1:5001 to show the application running on a web browser. 

<img width="1132" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/9b151842-41f8-40ff-972b-ab434896bfa7">

**4. Tag Docker image and push to Docker hub**
* Image created was tagged using **_docker tag image-name docker-hub-username/image-name:version-tag_**
* Logged in using **_docker login_**
* Image was then pushed to Docker hub using **_docker push docker-hub-username/image-name:version-tag_**
* The Docker image should be seen on your Docker hub 

**Image information**

**Name:** webapp-devops 

**Tags:** 1.0

**Instructions for use:** 

* You can pull this image created by using **_docker pull samiaaax/webapp-devops:1.0_** 
* You can push using **_docker push samiaaax/webapp-devops:tagname_**

<img width="1085" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/13b96ae5-3205-4434-ad22-8ebe08f591d5">

## **Defining Networking Services and AKS Cluster with IaC**

I have been tasked to deploy the containerized application onto a Kubernetes Cluster to ensure application scalability. To to this, I have chosen to implement infrastructure as code using Terraform. 

**Creating a Terraform Project and Module**

I created a Terraform project that will serve as the foundation for provisioning an Azure Kubernetes Service (AKS) cluster using infrastructure as code (IaC). The project was organized into two Terraform modules: one for provisioning the necessary Azure Networking Services (networking-module) for an AKS cluster and one for provisioning the Kubernetes cluster itself (aks-cluster-module). 

**Defining the Networking Module Input Variables**

Inside the networking module directory, the following input variables were defined in a variables.tf file.  
* **A resource_group_name** variable that will represent the name of the Azure Resource Group where the networking resources will be deployed in. 
* **A location variable** that specifies the Azure region where the networking resources will be deployed to. 
* **A vnet_address_space variable** that specifies the address space for the Virtual Network (VNet)

<img width="627" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/465d40ad-7496-4ed2-bf5e-0a0704867ffb">

**Defining Networking Resources and NSG rules**

Within the networking module's main.tf configuration file, the following networking resources for an AKS cluster are defined: 
* **Azure Resource Group:** Named this by resource by referencing the resource_group_name variable created variables.tf file 
* **Virtual Network (VNet):** aks-vnet
* **Control Plane Subnet:** control-plane-subnet
* **Worker Node Subne**t: worker-node-subnet
<img width="671" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/be5c4295-90de-4281-93c5-fa07627764e1">

* **Network Security Group (NSG)**: aks-nsg

Within the NSG, two inbound rules inbound rules were defined: one to allow traffic to the kube-apiserver (named kube-apiserver-rule) and one to allow inbound SSH traffic (named ssh-rule).
<img width="731" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/70372c6b-57bb-4c70-a526-0fe2c8584a19">

**Defining the Networking Module Output Variables**

Within the network-module, output.tf file was created to define the following output variables: 
* **A vnet_id variable** that will store the ID of the previously created VNet. 
* **A control_plane_subnet_id** variable that will hold the ID of the control plane subnet within the VNet.
* **A worker_node_subnet_id variable** that will store the ID of the worker node subnet within the VNet. 
* **A networking_resource_group_name variable** that will provide the name of the Azure Resource Group where the networking resources were provisioned in. 
* **A aks_nsg_id variable** that will store the ID of the Network Security Group (NSG).
<img width="651" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/c1261b73-5d26-429f-8f51-9bb5339a5cdf">

This networking module was then initialised by running terraform init command. 

**Defining the AKS Cluster Module Input Variables**

Within the aks-cluster module, the following input variables are defined: 
* **A aks_cluster_name variable** that represents the name of the AKS cluster
* **A cluster_location variable** that specifies the Azure region where the AKS cluster will be deployed to
* **A dns_prefix variable** that defines the DNS prefix of cluster
* **A kubernetes_version variable** that specifies which Kubernetes version the cluster will use
* **A service_principal_client_id variable** that provides the Client ID for the service principal associated with the cluster
* **A service_principal_secret variable** that supplies the Client Secret for the service principal
<img width="649" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/a1f0b9b4-5ce8-4733-a733-21b33a29eb0b">

**Defining AKS Cluster Resources**

In the main.tf file within the aks-cluster module, resources were defined which included creating the AKS cluster, specifying the node pool and the service principal. This was done by using the input variables as arguments. 
![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/e6c552fa-e392-4713-a96f-d34b16341ccb)

**Defining the AKS Cluster Module Output Variables**

Within the outputs.tf file in the aks-cluster module, the following output variables are defined: 
* **A aks_cluster_name variable** that will store the name of the provisioned cluster
* **A aks_cluster_id variable** that will store the ID of the cluster
* **A aks_kubeconfig variable** that will capture the Kubernetes configuration file of the cluster. 

<img width="664" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/a5f2d00a-72d8-4f81-bffd-2c29ea01db52">

This aks-cluster module was then initialised by running terraform init command. 

**Creating an AKS Cluster with IaC**

In the project's main directory called aks-terraform, a main.tf configuration file was created. Within this file, the Azure provider block  is defined to enable authentication to Azure using a personal service principal credentials. The input variables for the client_id and client_secret arguments are defined in a variables.tf file. 

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/2718f662-36b2-452d-9f3d-c7d409b4d3db)

<img width="416" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/637ac888-a3dc-460e-9195-ba83df7c470b">

To use these variables securely, in a text editor in a command line, .zshrc file is opened and these lines were added: 
![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/b5db2fa5-ea55-4be7-a4a6-167173e48675)

After provisioning the provider block, the networking and aks-cluster modules are integrated in the project's main configuration file:

<img width="593" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/fe394769-9b84-41e0-8207-b6f9dc554b2e">

Within the main project directory, the Terraform project is initialised by running terraform init command. Afterwards, terraform apply is run to initiate the creation of the defined infrastructure, including the networking resources and AKS cluster. The resultant state file is added to .gitignore to avoid exposing any secrets.

<img width="930" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/7a815993-df4e-471b-af84-032e8c8677df">

<img width="1044" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/15c146cc-0fcb-4e8a-bf63-835b81e6bc4a">

<img width="795" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/86ff72aa-f1a9-4a02-8008-bc497b0eae68">

## **Kubernetes Deployment to AKS**

With the necessary infrastructure in place, the next step is to proceed with the deployment of the containerised application to the AKS cluster. 

**Deployment and Service Manifests**

Firstly, a Kubernetes manifest file, named application-manifest.yaml is created. Inside this file, the necessary Deployment resource was defined, which deploys your containerized web application onto the Terraform-provisioned AKS cluster and contains the following necessary information: 
* **Deployment named flask-app-deployment** that acts as a central reference for managing the containerized application
* **replicas** set to maintain two identical replicas of this application
* **selector** section helps the Deployment identify and manage Pods with the label app:flask-app
* **template** section describes how the Pods should look. The label app:flask-app is assigned to Pods created by this template. Inside the template, there's a container definition named flask-app-container. It uses the Docker image version 1.0 and exposes port 5001 for the application.
* **strategy** the deployment strategy is set to RollingUpdate. This strategy ensures a smooth transition during updates. Specifically, it allows at most one old Pod to be unavailable at a time (maxUnavailable: 1) and limits the number of new Pods added simultaneously to one (maxSurge: 1).
![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/b13f7e61-dded-4555-8698-aed7dfb4eb19)

After this, the necessary Service resource was defined within the same manifest file to facilitate internal communication within the AKS cluster. This included the following information:
* **service named flask-app-service:** this service is configured to direct traffic to Pods labeled with app: flask-app.
* **ports:** when services within the cluster want to communicate with this application, they can use the service's cluster IP address and port 5001, as defined in targetPort.
* **service type:** set to ClusterIP, designating it as an internal service within the AKS cluster
![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/8b27b039-bfe1-4d56-a425-26452b2c1979)

**Deploying Kubernetes manifest to AKS**

Before deploying the Kubernetes manifests to AKS cluster, the current Kubernetes context is set to the correct cluster (Terraform-provisioned AKS cluster). The context specifies the cluster and user details for the AKS cluster, ensuring the deployment occurs in the intended environment. To do this, the following commands were run: 
_**kubectl config get-contexts**_ to check the available Kubernetes contexts and _**kubectl config use-context terraform-aks-cluster**_ to switch to the correct Terraform context.
![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/17849391-4833-437f-947d-822a56f7ed07)

So now by operating in the AKS context, deployment can proceed. This was done by applying the manifest file using _**kubectl apply -f application-manifest.yaml**_ which showed the deployment and service resources running. 

To test and validate the application after deployment, various kubectl commands were run. 
_**kubectl describe deployment**_ shows that the correct number of pods were running at a time (two identical pods running at a time).
![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/443c1ff2-2f30-442d-8f9c-b11b0929e184)

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/e3a4a39e-706c-43af-907c-eef000f0eeca)

_**kubectl describe services**_ command shows that Cluster IP is deployed to the AKS cluster with their specified ports. 
![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/9a0a28cd-a95c-4072-88fc-686046bd3c2a)

Once the health of pods and services were inspected, port forwarding was initiated to access the deployment locally by running _**kubectl port-forward <pod-name> 5001:5001**_ command.

<img width="1052" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/f86ec5b3-2cb1-4f57-b677-15295d33c651">

With port forwarding in place, the web application hosted within the AKS cluster was be accessed locally at http://127.0.0.1:5001 and the functionality of AddOrder was accessible. 
![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/3fdd3528-b183-4e90-9d73-0678459556ab)

Additionally, to confirm the deployment has been successful on the Azure Portal, navigating to the Workloads section will show that the application was deployed with the specified number of pods running. 
![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/af7dd8d0-1e31-4b91-8df0-0ce13b5de66f)

## **Creating a CI/CD pipeline on Azure DevOps**

Now that deployment of application to Kubernetes was successful, the next step is to create a CI/CD pipeline on Azure DevOps that will automate the containerisation and deployment process. 

**The Build Pipeline Setup**

First, an Azure DevOps Project was created and configured using the source repository on Github and selecting the project that hosts the application code. As an initial configuration, starter template was selected. 
A connection between Azure DevOps and the Docker Hub account where the application image is stored is needed to facilitate the seamless integration of the CI/CD pipeline with the Docker Hub container registry. To do this, a personal access token was created on Docker hub and an Azure DevOps service connection was created to utilize this token. From this, the configuration of the starter pipeline was modified to enable it to build and push a Docker image to Docker Hub. The pipeline was set to automatically run each time there is a push to the main branch of the application repository. 
![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/e6d79f08-2f7e-4cfb-8a40-1b3e41c551a7)

The pipeline was saved and ran: 
![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/f0f29384-b53f-4b5d-91fd-6bad95e56d03)

The latest image was shown on Dockerhub to validate the creation of CI/CD pipeline - it created the Docker image of the latest version: 
![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/8b1f23e2-5074-499e-8f27-b08f3004aab6)

**The Release Pipeline Setup**

Now that the build pipeline was setup for the containerisation process, the release pipeline needed to be set up to automate the deployment process. To do this, an AKS service connection within Azure DevOps was configured using Azure Resource Manager. 
<img width="809" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/3fbc4f13-b949-4925-a446-77a42e7fcb82">

Afterwards, this service connection and the application manifest was used to facilitate the automatic deployment of the application to the AKS cluster. 
<img width="736" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/67fecaf2-24eb-4acd-83c2-4986018d754b">

The pipeline was saved and ran: 
![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/c967351d-416a-481b-bbf7-368a334236cc)

<img width="1461" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/baed1043-6c9a-4d79-bf2c-68eeb4ad6530">

The deployment of the application was validated and the application's behaviour was monitored using kubectl commands:
<img width="930" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/525c1bfd-87b3-44f5-bc10-d08d5723f091">

<img width="1176" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/14fb7411-0667-4c73-bb5b-655878f4ce92">

Port-forward was initiated by using kubectl command to access the application locally and to validate the functionality of the deployment: 
<img width="1044" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/a2210839-40c1-402d-b769-a11480238a4a">

<img width="1342" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/e34dac41-55e0-408f-a0ec-34af5e1560de">

## **AKS Cluster Monitoring**

Monitoring and alerting of the AKS cluster is needed to address any potential issues during and after the deployment of the application.

**Setting up Container Insight**

A container insight was enabled to efficiently monitor the application performance and health of AKS cluster. This was done by writing the following command on CLI: 
<img width="1177" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/e2906bc4-2f62-4f11-8666-1f3f7e6f5fb9">

The --enable-managed-identity command allows the AKS cluster to use a Microsoft Entra ID identity instead of the Service Principal to authenticate with Azure services. To collect advanced data and metrics from the cluster, using Container Insights, the cluster needs to have managed identity enabled.

Secondly, permissions to the Service Principal was added on Azure portal. The following three roles were assigned one by one: 

**Monitoring Metrics Publisher**
**Monitoring Contributor**
**Log Analytics Contributor**

<img width="466" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/78b82b78-607e-4a9d-b1c0-a99575e18579">

After container insights is configured and enabled, container Insights begins collecting data from your AKS cluster once activated but doesn't show historical data. For it to start collecting data, the cluster was restarted after logging in from the CLI: 

<img width="1058" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/daec71c2-5b3e-4b49-bda1-671300f4ceab">

<img width="1393" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/733aa68d-1155-4e62-9029-7aa284202f75">

**Log Analytics Configuration**

Azure Log Analytics is a service that monitors cloud and on-premises resources and applications. It allows you to collect and analyze data generated by resources in your cloud and on-premises environments. Log Analytics was configured on the terraform-aks-cluster to execute the following logs:

**1.Average Node CPU Usage Percentage per Minute** 

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/8584c3a7-3c47-40aa-b8bf-8b6d3fac1dc2)

**2.Average Node Memory Usage Percentage per Minute**

**3.Pods Counts with Phase**

**4.Warning Value in Container Logs**

**5.Kubernetes Events**

After these were set up, they were saved and pinned to the dashboard for further referencing and to be able to run them again when required. 

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/f982f7cb-2ae1-402f-84f4-5627d073339a)

**Configuring Alarms and Alert Rules**

An alert rule to trigger an alarm when the used disk percentage in the AKS cluster exceeds 90% was set up. 
The alert checks every 5 minutes and have a loopback period of 15 minutes, and the alert was configured to send notifications to my email address. 

<img width="1023" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/83e77577-c823-4864-ac5f-62e2f4257430">

By Default, the resource group has the alert rules for CPU usage and memory working set percentage were already in place. 

<img width="1461" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/680c6caa-d494-4e62-bae2-5eb6e08ff498">

These alert rules were adjusted to trigger when they exceed 80%. CPU and memory are critical resources in the AKS cluster. When they are heavily utilized, it can lead to decreased application performance. By setting alert rules to trigger at 80%, it ensures that notifications are sent when these resources are approaching critical levels.

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/385793c8-9257-468a-8b92-391a22d7473d)

**AKS Integration with Azure Key Vault for Secrets Management** 

Currently, the credentials for establishing a connection with the Azure SQL Database are hardcoded within the application code. Therefore implementing a solution to securely store and retrieve the database credentials is essential to handling sensitive information.   

**Creating a Key Vault and Secrets** 

A Key Vault was created for the process of securing the application code where the sensitive information is securely stored. Key Vault Adminstrator role was assigned to Microsoft Entra ID user to grant the necessary permissions for managing secrets within the Key Vault. 

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/8974911d-2511-484e-b2be-495a9b1836c5)

Within this Key Vault, the following secrets were configured to connect to the backend database: 
**1.Server Name**
**2.Server Username**
**3.Server Password**
**4.Database Name**

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/fc1ce72e-38b5-42d8-a2f7-a247b264a4ab)

**Enabling Managed Identity for AKS and Assigning Permissions**

Managed Identity for the AKS cluster was enabled to allow it authenticate and interact securely with the Key Vault without exposing credentials. To do this, the following command was ran on Azure CLI after logging in: **_az aks update --resource-group (resource-group) --name (aks-cluster-name) --enable-managed-identity_**

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/4e05e626-dbc6-4148-9703-e26e4ce6e58b)

The following command was executed to get information about the managed identity created for the AKS cluster: **_az aks show --resource-group (resource-group) --name (aks-cluster-name) --query identityProfile_**

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/3465e0ac-f1de-4982-9840-5a3aa11a3a0f)

The clientID from this command was then used to execute the command to assign permissions to the managed identity: 

<img width="1021" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/82442cea-cbf8-4b52-906c-483e87e0e559">

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/09d1eee9-0c99-4a26-93ef-4834aa70b218)

Assigning the Key Vault Secrets Officer role to the managed identity associated with AKS, allows it to retrieve and manage secrets. 

**Updating the application code**  

Integrating the Azure Identity and Azure Key Vault libraries into the Python application code facilitates communication with Azure Key Vault. 

<img width="1059" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/aa23e957-8312-4af5-8bc4-e0c88f230a2a">

<img width="467" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/64094676-4a9e-4327-877c-0ea277eb41ac">

The requirements file for the application's Docker image was updated to include the newly required libraries.

<img width="584" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/68948d6e-73d1-4536-8473-744e8df81f14">

## **End-to-End Testing and Validation**

Firstly, testing of the modified application to ensure seamless integration with Azure Key Vault was done locally. 
This was done by kubectl commands: 

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/c87ee7d3-4a4e-40b1-982d-8d48d6121234)

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/efc1f2e3-1658-4902-9f6a-a23e0e459d87)

Deployment of the modified application to the AKS cluster using the pre-established Azure DevOps CI/CD pipeline included the following steps: 
1. Modifying azure-pipeline.yaml file for the building the new image 

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/011b0a32-2469-43d4-a8a2-7a3701282f51)


2. Running the establish pipeline on Azure DevOps

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/ceb36a4a-c97a-435c-bde4-f37149c650dc)
 

<img width="1155" alt="image" src="https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/48db6984-0bf1-447a-a85e-e954c2e0c0d1">

3. Testing the functionality of the application using port forwarding 

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/5c49b173-ba1a-457f-aa73-b4c1163add9c)

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/eb8c13a1-8241-4f52-97fd-0c8ca8dd937d)

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/5e22ab49-3f40-4560-9aac-4725aeb1a3f2)

![image](https://github.com/Samia-A-Mohamed/Web-App-DevOps-Project/assets/150970902/e09b43b8-9015-4624-9073-b807c282b547)


