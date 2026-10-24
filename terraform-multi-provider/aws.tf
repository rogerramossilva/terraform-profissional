resource "aws_s3_bucket" "dev" {
  provider = aws.dev
  bucket   = "empresa-dev-lab-rogerio"
}

resource "aws_s3_bucket" "prod" {
  provider = aws.prod
  bucket   = "empresa-prod-lab-rogerio"
}
