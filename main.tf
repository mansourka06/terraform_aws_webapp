##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
  access_key = "ACCESS_KEY"
  secret_key = "SECRET_KEY"
  region     = "us-east-1"
}

##################################################################################
# RESOURCES
##################################################################################
resource "aws_instance" "web_server" {
  ami           = "ami-abc123"
  instance_type = "t2.micro"
  key_name      = "my_key"
  security_groups = ["web-server-sg"]

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "echo 'Hello, World!' > /var/www/html/index.html",
    ]
  }
}

resource "aws_security_group" "web_server" {
  name        = "web-server-sg"
  description = "Security group for the web server"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_role" "web_server" {
  name = "web-server-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

