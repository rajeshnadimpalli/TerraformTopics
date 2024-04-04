provider "aws" {
  region     = "us-east-1"
  alias      = "east"
  access_key = ""
  secret_key = ""
}

provider "aws" {
  region = "us-west-2"
  alias  = "west"
}

module "infra_us_east_1" {
  source      = "./my_infrastructure"
  providers   = { aws = aws.east }
  bucket_name = "vibzr8888888888"
}

module "infra_us_west_2" {
  source      = "./my_infrastructure"
  providers   = { aws = aws.west }
  bucket_name = "vibzr99999999999"
}


# module "child_module" {
#   source = "./child_module"
#   # You can override the instance_type variable here if needed
#   # instance_type = "t2.micro"
# }

# resource "aws_instance" "ec2_example" {
#   ami           = "ami-080e1f13689e07408"
#   instance_type = module.child_module.child_instance_type
#   tags = {
#     Name = "Rajesh"
#   }
# }


# variable "testvariable" {
#   description = "An example variable"
#     type        = string  # Adjust the type as needed
#   # default = "some_value"  # Optional default value
# }

# resource "aws_instance" "ec2_example" {
#   ami           = "ami-080e1f13689e07408"
#   #instance_type = var.testvariable
#      instance_type = "t2.micro"
#   }
# lifecycle {
#   ignore_changes = [
#     tags["Name"],  # Ignore changes to the "Name" tag
#   ]
# }

