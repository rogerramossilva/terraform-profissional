resource "aws_s3_bucket" "count_bucket" {
  count = 3
  bucket = "count-lab-rogerramossilva-${count.index}"
}

resource "aws_s3_bucket" "env_bucket" {
  for_each = toset(var.environments)
  bucket = "env-rogerramossilva-${each.key}"
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket" "logs" {
  bucket = "empresa-logs-rogerramossilva"
}

resource "aws_s3_bucket" "app" {
  bucket = "empresa-app-rogerramossilva"
  depends_on = [
    aws_s3_bucket.logs
  ]
}