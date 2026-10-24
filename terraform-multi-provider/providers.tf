provider "aws" {
  alias   = "dev"
  profile = "dev"
  region  = "us-east-1"

  assume_role {
    role_arn = var.aws_dev_role
  }
}

provider "aws" {
  alias   = "prod"
  profile = "prod"
  region  = "us-east-1"
  assume_role {
    role_arn = var.aws_prod_role
  }
}

provider "azurerm" {
  alias = "dev"
  features {}
  subscription_id = var.azure_dev_subscription
}