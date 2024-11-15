provider "aws" {
    region = "eu-central-1"  
}

data "aws_vpc" "default_vpc"{
    default = true
}

locals {      
  ingress_rules = [
    {
        port = 443 #var.port_443
    description= "Port 443 - Https"
    },
     {
        port = 22
    description= "Port 22 - SSH"
    },
     {
        port = 80
    description= "Port 80 - Http"
    },
    {
        port = 29
    description= "Port 29 - smtp"
    }
    ]
}

# locals = list(map)



resource "aws_security_group" "dynamic_sg" {
    name = "Dynamic_SG"
    vpc_id = data.aws_vpc.default_vpc.id

    dynamic "ingress" {
        for_each = local.ingress_rules

        content {
        description = ingress.value.description
        from_port = ingress.value.port
        to_port = ingress.value.port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }

    }

    # ingress {
    #     description = "Port 22 - SSH"
    #     from_port = 22
    #     to_port = 22
    #     protocol = "tcp"
    #     cidr_blocks = ["0.0.0.0/0"]
    # }

    # ingress {
    #     description = "Port 80- Http"
    #     from_port = 80
    #     to_port = 80
    #     protocol = "tcp"
    #     cidr_blocks = ["0.0.0.0/0"]
    # }
  
    # ingress {
    #     description = "Port 443- Https"
    #     from_port = 443
    #     to_port = 443
    #     protocol = "tcp"
    #     cidr_blocks = ["0.0.0.0/0"]
    # }
}