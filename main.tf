terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "vm-web" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "Kojak's second demo EC2"
    Env = "dev"
  }
}

output "ec2_ip" {
  description = "The IP of the created EC2."
  value       = aws_instance.vm-web.public_ip
}

output "ec2_id" {
  description = "The ID of the created EC2."
  value       = aws_instance.vm-web.id
}
