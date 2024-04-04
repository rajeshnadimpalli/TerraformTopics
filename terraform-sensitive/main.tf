
provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}


resource "random_pet" "name" {
  length    = 2
  separator = "-"
}

resource "aws_s3_bucket" "my_sensitive_bucket" {
  bucket = "my-sensitive-bucket-${random_pet.name.id}"
}

/*This configuration creates an S3 bucket with a unique name and applies a bucket
 policy that denies all actions on the bucket if the request is not made over HTTPS.*/
resource "aws_s3_bucket_policy" "my_sensitive_bucket_policy" {
  bucket = aws_s3_bucket.my_sensitive_bucket.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "s3:*",
        Effect    = "Deny",
        Resource  = [
          "${aws_s3_bucket.my_sensitive_bucket.arn}",
          "${aws_s3_bucket.my_sensitive_bucket.arn}/*"
        ],
        Principal = "*",
        Condition = {
          Bool = {
            "aws:SecureTransport": "false"
          }
        }
      }
    ]
  })
}

output "s3_bucket_arn" {
  value     = aws_s3_bucket.my_sensitive_bucket.arn
  sensitive = true
}
