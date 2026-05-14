provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket         = "my-terraform-bucket-12345-abs"
    key            = "project1/terraform.tfstate"
    region         = "ap-south-1"
  }
}

resource "aws_s3_bucket" "my_bucket12345" {
  bucket = "my-terraform-bucket-12345-abs"

  tags = {
    Name = "MyBucket"
  }
}


#to ise this make sure that you have already have the bucket in s3
#In Recipe 13 → Terraform created a bucket and stored state locally (.tfstate)

#In Recipe 14 → You told Terraform:

#“Store the state file in S3 instead of my local system”

#So now:

#Your infrastructure (bucket) → still in AWS
#Your state file → now also in AWS (S3  remote state storage so anyone can use it beyond one user