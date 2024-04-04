terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "state-files/example-s3-bucket.tfstate"
    region = "us-east-1"
  }
}
