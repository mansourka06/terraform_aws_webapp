# terraform_aws_webapp
This repository setup a deployment of a web application in AWS using Terraform


In this project, i build a configuration that will create an EC2 instance, a security group that allows incoming traffic on port 80, and an IAM role that allows the EC2 instance to access AWS resources. The provisioner block will run the commands specified in the inline array to install and configure the Apache web server on the EC2 instance. When you run terraform apply, Terraform will create the resources in AWS and install the web application on the EC2 instance.


## Prerequisites
   * AWS account
   * Terrform installed in your dev host
   
## Getting Started
:information_source: **Information** : 

Here is same instructions for how to set up the development environment and how to run your code.

  - Install and configure Terraform on your local machine.
  - Create a Terraform configuration file that defines your AWS infrastructure. This file should specify the resources that you want to create, such as an EC2, instance, a security group, and an IAM role.
  - Run terraform init to initialize the Terraform configuration and download any required plugins.
  - Run terraform plan to generate an execution plan for your infrastructure. This will show you what Terraform will do when you apply the configuration.
  - If the plan looks correct, run terraform apply to create the resources in AWS.

## OS supported
- [x] RedHat 

# Author
Mansour KA - [Email](kamansour06@gmail.com)

# Conclusion
I hope this is useful for you. 
I'm open to hear feedbacks and suggestions for revisions.

Thanks and happy automating!

Mansour :)
