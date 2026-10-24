provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "west"
  region = "us-west-2"
}

provider "azurerm" {
  features {}
}

provider "google" {
  project = "labterraform-497314"
  region  = "us-central1"
}
