module "aws_storage_dev" {
  source      = "./modules/aws-storage"
  bucket_name = "empresa-dev-aws-rogerio"
}

module "aws_storage_hml" {
  source      = "./modules/aws-storage"
  bucket_name = "empresa-hml-aws-rogerio"
}

module "aws_storage_prod" {
  source      = "./modules/aws-storage"
  bucket_name = "empresa-prod-aws-rogerio"
}


module "azure_storage_dev" {
  source = "./modules/azure-storage"

  storage_account_name = "empdevstorageroger"
  resource_group_name  = "rg-dev"
  location             = "East US"
}

module "azure_storage_hml" {
  source = "./modules/azure-storage"

  storage_account_name = "emphmlstorageroger"
  resource_group_name  = "rg-hml"
  location             = "East US"
}


module "azure_storage_prod" {
  source = "./modules/azure-storage"

  storage_account_name = "empprodstorageroger"
  resource_group_name  = "rg-prod"
  location             = "East US"
}

module "gcp_storage_dev" {
  source = "./modules/gcp-storage"

  bucket_name = "empresa-dev-gcp-rogerio"
  location    = "US"
}

module "gcp_storage_hml" {
  source = "./modules/gcp-storage"

  bucket_name = "empresa-hml-gcp-rogerio"
  location    = "US"
}

module "gcp_storage_prod" {
  source = "./modules/gcp-storage"

  bucket_name = "empresa-prod-gcp-rogerio"
  location    = "US"
}