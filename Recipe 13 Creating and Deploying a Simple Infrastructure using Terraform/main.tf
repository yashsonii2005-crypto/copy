provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "my_bucket12345" {
  bucket = "my-terraform-bucket-12345-abs"

  tags = {
    Name = "MyBucket"
  }
}