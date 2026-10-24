resource "aws_s3_bucket" "west" {
 provider = aws.west
 bucket = "lab-bucket-west-rogerramossilva"

 tags = {
   Environment = "Lab"
   Region      = "us-west-2"
 }
}
