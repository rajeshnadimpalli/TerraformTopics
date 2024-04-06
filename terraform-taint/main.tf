provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "example" {
  ami           = "ami-080e1f13689e07408" # Ensure this AMI is valid in your selected region; this one is for us-east-1
  instance_type = "t2.micro"

  user_data = <<-EOF
    #!/bin/bash
    apt-get update && apt-get install -y nginx  # Intentional error: 'nginxxxx' should be 'nginx'
  EOF

  tags = {
    Name = "TerraformExample"
  }
}
