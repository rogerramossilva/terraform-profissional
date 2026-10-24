output "aws_dev_bucket" {
  value = module.aws_storage_dev.bucket_id
}

output "aws_hml_bucket" {
  value = module.aws_storage_hml.bucket_id
}

output "aws_prod_bucket" {
  value = module.aws_storage_prod.bucket_id
}


output "azure_dev_storage" {
  value = module.azure_storage_dev.storage_id
}

output "azure_hml_storage" {
  value = module.azure_storage_hml.storage_id
}

output "azure_prod_storage" {
  value = module.azure_storage_prod.storage_id
}

output "gcp_dev_bucket" {
  value = module.gcp_storage_dev.bucket_id
}

output "gcp_hml_bucket" {
  value = module.gcp_storage_hml.bucket_id
}

output "gcp_prod_bucket" {
  value = module.gcp_storage_prod.bucket_id
}