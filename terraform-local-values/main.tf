provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

variable "my_prefix" {
  description = "Prefix for the tags"
  type        = string
}

resource "random_id" "tag_suffix" {
  byte_length = 8
}

locals {
  combined_tag = "${var.my_prefix}-${random_id.tag_suffix.hex}"
}

resource "aws_instance" "example1" {
  ami           = "ami-080e1f13689e07408" # Replace with a valid AMI ID
  instance_type = "t2.micro"
  tags = {
    Name = local.combined_tag
  }
}

resource "aws_s3_bucket" "example1" {
  bucket = "my-bucket-${random_id.tag_suffix.hex}"
  tags = {
    Name = local.combined_tag
  }
}
