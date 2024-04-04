provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "example" {
  ami           = "ami-080e1f13689e07408" # Replace this with a valid AMI for your region
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform EC2"
  }

  ebs_block_device {
    device_name = "xvdb"
    volume_size = 8
    tags = {
      Name = "xvdb_8"
    }
  }

  ebs_block_device {
    device_name = "xvdc"
    volume_size = 10
     tags = {
      Name = "xvdc_10"
    }
  }
}

# Output to display the EBS volume IDs
output "volume_ids" {
  value = aws_instance.example.ebs_block_device.*.volume_id
}
