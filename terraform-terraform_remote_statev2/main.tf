provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_s3_bucket" "example" {
  bucket = "my-unique-bucket-vibzr-123"
}

output "bucket_arn" {
  value = aws_s3_bucket.example.arn
}
