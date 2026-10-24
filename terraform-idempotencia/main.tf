resource "aws_s3_bucket" "lab" {

  bucket = "terraform-lab-idempotencia-roger"

  tags = {
    Name        = "lab-idempotencia"
    Environment = "prod"
  }
}
