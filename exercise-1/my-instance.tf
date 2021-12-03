provider "aws" {
    region = "us-west-1"
        default_tags {
            tags = {
                Owner   = "Christian",
                Client  = "Internal",
                Project = "Bootcamp"
            }
        }
}

resource "aws_security_group" "christian-bootcamp" {
    name        = "christian-bootcamp"
        description = "Created by Terraform in exercise 1 of bootcamp"

        ingress {
            from_port   = 22
                to_port     = 22
                protocol    = "tcp"
                cidr_blocks = ["98.208.42.143/32"]
        }

    egress {
        from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "christian-bootcamp",
    }
}

resource "aws_security_group" "christian-http" {
    name        = "christian-http"
        description = "Created by Terraform in exercise 1 of bootcamp"

        ingress {
            from_port   = 80
                to_port     = 80
                protocol    = "tcp"
                cidr_blocks = ["98.208.42.143/32"]
        }

    ingress {
        from_port   = 443
            to_port     = 443
            protocol    = "tcp"
            cidr_blocks = ["98.208.42.143/32"]
    }

    egress {
        from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "christian-bootcamp",
    }
}

variable "aws_instance_type" {
    type = string   
}

resource "aws_instance" "christian-terraform" {
    ami                     = "ami-054965c6cd7c6e462"
        instance_type           = var.aws_instance_type
        key_name                = "christian-keypair"
        vpc_security_group_ids  = [
        aws_security_group.christian-bootcamp.id,
        aws_security_group.christian-http.id]
            tags = {
                Name = "christian-terraform-instance",
            }
}
