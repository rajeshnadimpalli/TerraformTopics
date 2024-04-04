provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

#SPLAT
# resource "aws_instance" "example" {
#   for_each = toset(["instance1", "instance2"])
#   ami = "ami-080e1f13689e07408"
#   instance_type = "t2.micro"
# }

# output "instance_ips_with_foreach" {
#   value = {for key, instance in aws_instance.example : key => instance.public_ip}
# }

#COUNT
resource "aws_instance" "example" {
  count = 3 # creates three instances
  ami = "ami-080e1f13689e07408"
  instance_type = "t2.micro"
}

output "instance_ips_with_count" {
  value = aws_instance.example[*].public_ip
}

