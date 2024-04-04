# provider "aws" {
#   alias  = "east"
#   region = "us-east-1"
# }

# provider "aws" {
#   alias  = "west"
#   region = "us-west-2"
# }

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
 }

