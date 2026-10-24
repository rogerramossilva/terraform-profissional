output "bucket_id" {
  description = "Identificador único do bucket Amazon S3."
  value = aws_s3_bucket.bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}
