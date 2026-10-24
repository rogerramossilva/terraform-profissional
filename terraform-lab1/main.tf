resource "aws_s3_bucket" "lab" {
  bucket = "lab-terraform-aula1-aws-rogerio"
}

resource "azurerm_resource_group" "lab" {
  name     = "rg-lab-terraform-rogerio"
  location = "East US"
}

resource "google_storage_bucket" "lab" {
  name     = "lab-terraform-gcp-rogerio"
  location = "US"
}