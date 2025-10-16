# 🚀 Terraform AWS Deployment

This project demonstrates how to **provision and deploy infrastructure on AWS using Terraform** and a **deployment script (`scripts/deploy-webapp.sh `)**.
It’s a hands-on DevOps project showing Infrastructure as Code (IaC) and automation in AWS using Terraform

---

## 📜 Description

In this project, i build a configuration that will create an EC2 instance, a security group that allows incoming traffic on port 80, and an IAM role that allows the EC2 instance to access AWS resources. The provisioner block will run the commands specified in the inline array to install and configure an nginx web server on the EC2 instance. When you run terraform apply, Terraform will create the resources in AWS and install the web application on the EC2 instance.

---

## 📂 Project Structure

```
├── terraform/main.tf           # Terraform configuration for AWS resources  
├── scripts/deploy-webapp.sh    # Deployment script to automate execution  
```

---

## ⚡ Features

* 🌍 Infrastructure provisioning with **Terraform**
* ☁️ Automated deployment on **AWS**
* 📜 Simple shell script that deploy the web application
* 🛠️ Demonstrates Infrastructure as Code (IaC) best practices

---

## 🛠️ Prerequisites

Make sure you have:
* ✅ AWS account (access_key and secret_key)
* ✅ [Terraform](https://developer.hashicorp.com/terraform/downloads) installed
* ✅ AWS CLI configured (`aws configure`) with proper credentials
* ✅ Bash shell (Linux/Mac/WSL)

---

## 🚀 How to Run

:information_source: **Information** : 

1. **Clone this repository**

   ```bash
   git clone https://github.com/mansourka06/terraform_aws_webapp.git
   cd terraform_aws_webapp
   ```

2. **Initialize Terraform**

   ```bash
   cd terraform
   terraform init
   ```

3. **Validate & Plan**

   ```bash
   terraform validate
   terraform plan
   ```

4. **Destroy Infrastructure (when done)**

   ```bash
   terraform destroy -auto-approve
   ```

---

## 📌 Learning Outcomes

* Understand **Terraform basics** (providers, resources, state management)
* Automate deployments with **Shell scripting**
* Hands-on AWS infrastructure provisioning

---

## 🔗 Resources

* [Terraform AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
* [Terraform CLI Docs](https://developer.hashicorp.com/terraform/cli)

---

# Author
Mansour KA - [Email](kamansour06@gmail.com)


I hope this is useful for you. 
I'm open to hear feedbacks and suggestions for revisions.

Thanks and happy automating!

Mansour :)
