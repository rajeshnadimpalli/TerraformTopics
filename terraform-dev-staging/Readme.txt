Create a single main.tf file 
Create a variables.tf file
Create a dev.auto.tfvars file for the dev environment variables
Create a staging.auto.tfvars file for the staging environment variables
-------------
terraform init

terraform workspace new dev
terraform workspace select dev
terraform apply -var-file="dev.auto.tfvars"

terraform workspace new staging
terraform workspace select staging
terraform apply -var-file="staging.auto.tfvars"
---------------------------
If you don't use -var-file during apply you will the issu:
dev workspace is using variables from staging.auto.tfvars, can happen 
if the *.auto.tfvars files are not being picked up correctly by Terraform 
based on the workspace. Terraform automatically loads all .auto.tfvars 
files in alphabetical order
---------------------------------
