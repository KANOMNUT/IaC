# Terraform Guide

This guide will help you set up Terraform on your local machine and run it for the first time. Terraform is a popular Infrastructure as Code (IaC) tool that allows you to define and manage your infrastructure as code.

## Prerequisites

- A machine running on Linux, macOS, or Windows.
- A command-line interface (CLI) tool such as Bash, PowerShell, or Terminal.

## Install Terraform

- Go to [the official Terraform website](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) and download the latest version of Terraform for your operating system.
- Extract the downloaded file to a directory in your system path
- Verify the installation by running the command ```terraform -v``` in your terminal. If Terraform is installed correctly, you should see the version number displayed in your terminal.

## Configuring Kubernetes

- Terraform requires access to your Kubernetes cluster to deploy resources. Ensure that you have a kubeconfig file located in the path ~/.kube/config.

## Running Terraform for the first time
- Navigate to the directory where your Terraform files are located by using the command line.
```powershell
terraform init
terraform plan -var-file="filename.tfvars" -state="terraform.state"
terraform apply -var-file="filename.tfvars" -state="terraform.state" --auto-approve
```

## Updating Terraform configuration
- Navigate to the directory where your Terraform files are located by using the command line.
```powershell
terraform plan -var-file="filename.tfvars" -state="terraform.state"
terraform apply -var-file="filename.tfvars" -state="terraform.state" --auto-approve
```

## Clean up resource

- Navigate to the directory where your Terraform files are located by using the command line.
```powershell
terraform destroy -var-file="filename.tfvars"-state="terraform.tfstate" --auto-approve
```