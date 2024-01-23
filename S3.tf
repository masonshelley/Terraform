resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-tf-test-bucket-mgs1993"

  tags = {
    Name        = "My S3 Bucket"
    Environment = "Dev"
  }
}