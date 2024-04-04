provider "aws" {
  region = "us-east-1"
  #   shared_credentials_file = "~/.aws/credentials"
  #   profile                 = "default"
  #   access_key = ""
  #   secret_key = ""
}

/*PS C:\Users\rajna\OneDrive\work_onedrive\Terraform\terraform-topics\terraform-TF_LOG> $env:TF_LOG = "DEBUG"
PS C:\Users\rajna\OneDrive\work_onedrive\Terraform\terraform-topics\terraform-TF_LOG> $env:TF_LOG_PATH = "C:\work\terraform.log"
PS C:\Users\rajna\OneDrive\work_onedrive\Terraform\terraform-topics\terraform-TF_LOG> terraform plan     */
resource "aws_s3_bucket" "b" {
  bucket = "my-vibzrtinwindows2-s3-bucket-12345"
  #acl    = "private"
}

output "bucket_name" {
  value = aws_s3_bucket.b.id
}