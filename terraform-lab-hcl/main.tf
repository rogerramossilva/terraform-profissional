resource "aws_s3_bucket" "lab" {
  bucket = local.bucket_name
}
