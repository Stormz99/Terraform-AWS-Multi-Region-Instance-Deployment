Terraform AWS Multi-Region Instance Deployment
This repository contains Terraform scripts to create an AWS instance running Ubuntu in multiple regions (eu-west-1 and eu-central-1) within a minimum of 2 availability zones. The setup is designed to be reusable and adaptable to different environments such as development (dev) and production (prod). Additionally, the scripts include the creation of a Virtual Private Cloud (VPC) to isolate the environments.

Prerequisites
Before using the Terraform scripts, ensure you have the following installed:
Visual Studio Code
Terraform
AWS CLI
Ansible
Docker
Make sure you have AWS credentials configured with the necessary permissions for creating instances, VPCs, and other resources.

Directory Structure
terraform-aws-multi-region-instance/
```
|-- server/-- central/
```
```
|       |-- main.tf
|       |-- variables.tf
|       |-- provider.tf
|       |-- variable.tf
|       |-- central-dev.tfvars
|       |-- central-prod.tfvars
|       |-- deploy.sh
```

```
|-- server/-- west/
|       |-- main.tf
|       |-- variables.tf
|       |-- provider.tf
|       |-- variable.tf
|       |-- west-dev.tfvars
|       |-- west-prod.tfvars
|       |-- deploy.sh
````

Initialize Terraform:
```
terraform init
```
Apply the Terraform configuration:
```
terraform apply
```
