provider "aws" {
  region = "ap-south-1"
}

# Security Group: allow SSH (22) and HTTP (80)
resource "aws_security_group" "web_sg" {
  name = "web-sg"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # open for demo; restrict in real setups
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance with user_data to install Apache
resource "aws_instance" "web_server" {
  ami           = "ami-0e12ffc2dd465f6e4"   # Amazon Linux 2 (ap-south-1 example)
  instance_type = "t2.micro"
  key_name      = "ec2key"

  security_groups = [aws_security_group.web_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Terraform Web Server</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Terraform-WebServer"
  }
}