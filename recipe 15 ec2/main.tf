provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0e12ffc2dd465f6e4"   # Amazon Linux 2 (example for ap-south-1)
  instance_type = "t2.micro"
  key_name      = "ec2key"

  tags = {
    Name = "Terraform-EC2"
  }
}