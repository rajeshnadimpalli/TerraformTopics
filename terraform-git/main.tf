provider "github" {
  #token = var.github_token  # $env:GITHUB_TOKEN="token"
  #token        = ""
  #organization = "your_github_org"
}

resource "github_repository" "terraform-projects-staging" {
  name        = "terraform-projects-staging"
  description = "terraform-projects-staging"
  visibility  = "public"
}
