# tfc-demo
Terraform Cloud Example
This is an example Terraform configuration intended for use with the Terraform Cloud

What will this do?
This is a simple Terraform configuration that will create an EC2 instance using your AWS account.

When you set up a Workspace on Terraform Cloud, you can link to this repository. Terraform Cloud can then run terraform plan and terraform apply automatically when changes are pushed.

What are the prerequisites?
You must have an AWS account and provide your AWS Access Key ID and AWS Secret Access Key to Terraform Cloud. Terraform Cloud encrypts and stores variables using Vault.

The values for AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY should be saved as environment variables on your workspace (created as sensitive data to keep them private).