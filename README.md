
                        CREATING SIMPLE "Hello World" API INFRASTRUCTURE on AWS

1: INTRODUCTION

API stands for Application Programming interface. It is a set of rules and protocols that 
allows different software applications to communicate and interact with each other. API 
defines the methods and data formats that applications can use to request and exchange 
information with each other, enabling them to work together seamlessly.

We can think of an API as a bridge between two different applications or systems. It allows 
developers to access specific functionalities or data from a service or platform without 
needing to understand the underlying implementation details. 

API are mostly used in web development, mobile app development, and various other 
software scenarios to enable integration, data sharing, and automation.
For the execution of this API infrastructure project, I will be making use of several AWS 
services and open-source tools like Node.js, Express framework, Jenkins, Docker, Terraform, 
Git, etc.

2: Requirements for the API Infrastructure

Containerization = I will be making use of Docker as a platform for encapsulating the API 
within a Container. This process entails the creation of an image specifically tailored to the 
API application, which encapsulates all the necessary components and dependencies 
required for the API to function seamlessly within its isolated environment. 
CI/CD (Continuous Integration/Continuous Deployment) = In the context of 
establishing a robust infrastructure for this API, I will be implementing a CI/CD framework. 
To achieve this, I will be incorporating Jenkins, a powerful automation tool, to orchestrate 
and streamline the entire CI/CD process.
 
 
2:  Jenkins will be responsible for automating various stages of development, including 
continuous integration, where code changes are systematically integrated into the 
repository, and continuous deployment, which involves the automated release of the
changes to the production environment. 

The utilization of Jenkins within the CI/CD pipeline will contribute to enhancing efficiency, 
reducing manual intervention, and ensuring consistent and reliable delivery of updates to 
the application.

Storage = I utilized Amazon S3, a secure and scalable object storage service to keep Jenkins 
artifacts and the terraform state files. Within this context, Amazon S3 functions as a 
versatile storage solution that accommodates the storage needs of these components. It 
securely houses the artifacts, encompassing all the necessary records and associated assets, 
while also acting as a reliable storage for the Terraform state files, which capture the 
current configuration and state of the infrastructure as managed by Terraform.

This strategic utilization of Amazon S3 ensures data durability, availability, and accessibility 
for both my application’s codebase and the essential infrastructure management files.
Tools and Services 

Node.js: Node.js is commonly used to build APIs due to its non-blocking, event-driven 
architecture, which is well suited for handling many concurrent connections. Building APIs 
with Node.js will create efficient and scalable applications that respond quickly to incoming 
requests.

Express Framework: Express is a popular and lightweight web application framework for 
Node.js that simplifies the process of building APIs and web applications. It provides a set of 
tools and features that help in defining routes, handling HTTP requests and responses and 
structure the application in a modular way.

VSCode(Virtual Studio Code)= This is a popular code editor that supports a wide range of 
programming languages and extensions. It will be used in this project to write, edit, and test 
the code for the API application. With extensions and integrations, VScode can work seamlessly with Terraform and Git to 
streamline the development and deployment process.
 
Terraform: Terraform is used as an infrastructure-as-code tool to define and provision the 
resources required for the API infrastructure. With Terraform, I define the infrastructure 
components (like EKS Clusters, EC2 instances, networking, security groups, VPC, etc.) in code 
using HashiCorp Configuration Language (HCL). This allows for consistent, repeatable, and 
version-controlled infrastructure deployment.

GitHub = GitHub is a code hosting platform that supports version control of the codebase 
using features like branches, pull requests etc., and collaboration. It will be used to store 
and manage the source code of the API.

AWS Elastic Container Registry (ECR): ECR is a fully managed Docker container registry 
provided by AWS. It will be used to store Docker container images that make up the API
application. These images can be versioned, tagged and managed. ECR integrates seamlessly 
with other AWS services, making it easy to deploy containers to services like EKS (Elastic 
Kubernetes Service), which is used in this project.

Elastic Kubernetes Service Clusters: Elastic Kubernetes service is a container orchestration 
platform. It’s used to manage, deploy, and scale the containerized API application. The 
Kubernetes cluster is set up to host the API container. Kubernetes ensures that the containers are running, handles scaling, load balancing, and 
provide self-healing capabilities.

Kubectl: Kubectl is a Kubernetes controller toll used to interact with Kubernetes Clusters. 
With kubectl, we can perform tasks related to managing and interacting with Kubernetes
clusters such as deploying applications, checking cluster status, scaling application etc.

Elastic Load Balancer (ELB): This is used to expose the EKS cluster, enabling external access 
to the API application within the cluster, distributing traffic, and enhancing the overall 
availability and reliability of the containerized API application.


 
                   PROCEDURES IN CREATING THE API INFRASTRUCTURE


STEP 1: API Source code
The API Application is developed using the Node.js programming language and relies on the 
Express framework to structure and handle various aspects of the API’s functionality.
The combination of Node.js and Express provides tools that will enable building fast, 
scalable, and responsive API.
 
STEP 2:  Configuring Terraform
To enhance the workflow, I established a connection between Terraform and the AWS 
account directly within Visual Studio Code (VSCode). This ensures seamless integration. 
However, to prioritize security measures, I took precautionary steps. I generated a profile 
that houses my AWS access key and Secret key. This approach serves as a secure way for 
terraform to establish a connection with the AWS account. (Alternatively, IAM Role can also 
be used to connect terraform securely to AWS account).

STEP 3 Deploying an EC2 instance with all dependencies 
(Jenkins, Git, Docker, Kubectl, Terraform)

I have devised a comprehensive plan that involves leveraging a Terraform script to 
automate the deployment of an EC2 instance. This instance will serve as the host for 
Jenkins. To initiate this process, I utilized the user-data feature to facilitate bootstrapping, 
which encompasses the installation of essential OS dependencies at the launch of the 
instance.

For the bootstrapping, the focus will be on installing several important components on the 
instance. This includes Jenkins, Git, Docker, Terraform and Kubectl.

STEP 4 Connecting VSCode to GitHub Repository
Connecting VSCode to a GitHub repository streamlines the coding workflow by providing an 
integrated environment for code editing. This connection enhances productivity and ensures that the code changes are effectively managed using GitHub.

STEP 5 Connecting GitHub Repository to Jenkins
Connecting Jenkins to GitHub repository involves establishing a link between Jenkins and my 
GitHub repository. This connection will enable Jenkins to perform various automated tasks, 
such as building, testing, and deploying code from the GitHub repository.

We can make use of Webhooks, to integrate GitHub automatically with Jenkins, so for all 
code commits pushed into GitHub repository, it will automatically trigger Jenkins to run 
build, test and deploy the code. 

STEP 6 Creating Amazon S3 (Simple Storage Service) and integrating with Jenkins.
 
  Terraform command to create S3 bucket
- Create S3 to store artifacts.
- Create an IAM role with “S3 full access” and assign it to Jenkins server.
- Install “S3 Publisher” Plugin on Jenkins
- Configure S3 profile on Jenkins.
- 
STEP 7 Creating Elastic Container Registry (ECR)
The ECR will serve as the repository where Jenkins will push the images built. It will store the 
container images.
After creating the ECR, the Push commands for the ECR will be integrated into the Jenkin 
file. 

STEP 8 Creating Docker file.
 
The Dockerfile outlines the steps required to build the Docker image for the Node.js API. 
Each line of the Dockerfile represents a specific action or instruction that contributes to 
creating the image.

STEP 9 Creating Jenkins file.

Jenkins file contains a pipeline definition that outlines a sequence of stages and sets of 
instructions for Jenkins to execute. This Jenkins file is what Jenkins application will use to build the image and push these 
images to Elastic Container Registry (ECR). It will then create an EKS Cluster, which is the 
backend infrastructure that will host the application.  And Jenkins will then create a terraform folder, and from that terraform folder, it will run
terraform Init and Apply. 
The command “kubectl apply -f node-deployment.yaml” is instructing Jenkins to deploy the 
content of the “node-deployment.yaml” file. Which is to integrate the images in the Elastic
Container Registry (ECR) onto the EKS Cluster.
The command “kubectl apply -f node-service.yaml” is instructing Jenkins to deploy the 
content of the “node-service.yaml” file, to the EKS Cluster. Which is to add Elastic Load 
balancer (ELB) to the EKS. 

The Elastic Load Balancer is what will expose the EKS Cluster to the internet.
On the Elastic Load Balancer created, the DNS name will be the link to access the application
on the Cluster from the internet.

In conclusion, using several AWS services and open-source tools, I was able to create the 
infrastructure for the “Hello World” API.
                        
