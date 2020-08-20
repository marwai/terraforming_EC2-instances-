# Terraform

## Downloading Terraform

1) Download [terraform](https://www.terraform.io/downloads.html)

2) Set the environment variable

3) User environment look for > path and copy the file location

![1st gif](images/1st%20gif.gif)

## What is Terraform?
-  There are 2 sides of IAC:
	- configuration management
	- orchestration

__Ansible__ - configuration management  
__Terraform__ - orchestration   
__Kubernetes__ - orchestration is used in containerisation - i.e Docker  
__Crio__ - Rocket


## Terraform
1. Orchestration tools to configure out instances and their AWS configurations remotely.
2. Terraform files are created with .`tf` extension
3. Set Environment variables, via `Environmental variables` and add the `ACCESS` and `SECRET` Keys as user variables. Terraform will automatically pick them up.
4. Make sure you refresh any current instances of `Git Bash` you have running as the environmental variables will not take effect until you have done that. Find the commands to create
the instance [below](#Terraform-Commands).

## Terraform commands:
- ```terraform init```
- ```terraform plan``` - checks the steps inside the code and lists success or errors
- ```terraform apply``` - will implement the code - deploy the infrastructure

## Terraforming

### 1st iteration open ports 80 to all
