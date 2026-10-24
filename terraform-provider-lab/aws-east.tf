resource "aws_s3_bucket" "east" {
 bucket = "lab-bucket-east-rogerramossilva"

 tags = {
   Environment = "Lab"
   Region      = "us-east-1"
 }
}
