resource "aws_s3_bucket" "app_storage" {
  bucket = var.bucket_name
}
