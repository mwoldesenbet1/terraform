#create S3 bucket
resource "aws_s3_bucket" "terraform-bucket1" {
  provider = aws.dev
  bucket = "mek-terraform-bucket-rsm1"  
}

#create S3 bucket
resource "aws_s3_bucket" "terraform-bucket3" {
  provider = aws.awstest
  bucket = "mek-terraform-bucket-rsm3"  
}