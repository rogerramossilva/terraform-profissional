terraform {
  backend "s3" {
    bucket = "terraform-state-rogerio-12345"
    key    = "techstore/terraform.tfstate"
    region = "us-east-1"
  }
}


