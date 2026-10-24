output "aws_bucket" {
  value = aws_s3_bucket.lab.bucket
}

output "azure_resource_group" {
  value = azurerm_resource_group.lab.name
}

output "gcp_bucket" {
  value = google_storage_bucket.lab.name
}
