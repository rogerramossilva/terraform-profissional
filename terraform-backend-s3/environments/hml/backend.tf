terraform {
  backend "s3" {

    bucket         = "empresa-terraform-state-rogerio"
    key            = "hml/terraform.tfstate"
    region         = "us-east-1"
    use_lockfile    = true
    encrypt        = true
  }
}
