output "bucket_name" {
  description = "Nome do bucket do projeto"
  value       = aws_s3_bucket.project.bucket
}

output "bucket_arn" {
  description = "ARN do bucket do projeto"
  value       = aws_s3_bucket.project.arn
}
