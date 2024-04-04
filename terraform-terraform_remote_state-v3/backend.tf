terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket-vibzr-123"
    key    = "state-files/example-s3-bucket.tfstate"
    region = "us-east-1"
  }
}
