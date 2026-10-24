output "count_buckets" {
  value = aws_s3_bucket.count_bucket[*].bucket
}

output "environment_buckets" {
  value = [
    for bucket in aws_s3_bucket.env_bucket :
    bucket.bucket
  ]
}