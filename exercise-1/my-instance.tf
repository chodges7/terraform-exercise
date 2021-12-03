provider "aws" {
    region = "us-west-1"
}

resource "aws_security_group" "christian-bootcamp" {
  name        = "christian-bootcamp"
  description = "Created by Terraform in exercise 1 of bootcamp"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["132.241.174.76/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "christian-bootcamp"
  }
}

resource "aws_instance" "christian-terraform" {
    ami                     = "ami-054965c6cd7c6e462"
    instance_type           = "t2.micro"
    key_name                = "christian-keypair"
    vpc_security_group_ids  = [aws_security_group.christian-bootcamp.id]
    tags = {
        Name = "christian-terraform-instance",
        Client = "Internal",
        Owner = "Christian"
    }
}
