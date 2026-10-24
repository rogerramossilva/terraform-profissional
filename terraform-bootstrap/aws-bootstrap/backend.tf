terraform {
  backend "s3" {
    bucket       = "empresa-terraform-state-rogerio"
    key          = "aws/prod.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}