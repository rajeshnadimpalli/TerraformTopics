provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "example" {
  ami           = "ami-080e1f13689e07408" # This is an example Ubuntu AMI ID for us-east-1; make sure to use the latest one
  instance_type = var.instance_type

  tags = {
    Name = "UbuntuInstance-${terraform.workspace}"
  }
}

