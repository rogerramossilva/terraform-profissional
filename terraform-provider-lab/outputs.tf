output "bucket_east" {
 value = aws_s3_bucket.east.id
}

output "bucket_west" {
 value = aws_s3_bucket.west.id
}

output "azure_resource_group" {
 value = azurerm_resource_group.lab.name
}

output "gcp_bucket" {
 value = google_storage_bucket.lab.name
}