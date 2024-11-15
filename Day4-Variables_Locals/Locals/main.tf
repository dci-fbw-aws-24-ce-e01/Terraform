provider "aws" {
    region = "eu-central-1"
}

locals {
    env= var.local_env
}

resource "aws_vpc" "prod_vpc" {
    cidr_block = "10.0.0.0/16"
    tags ={
        Environment = local.env
        Name = "${local.env}-VPC" #string interpolation
        Created_by = "Sharanya"
    }
}


resource "aws_subnet" "prod_public_subnet" {
    vpc_id = aws_vpc.prod_vpc.id
    cidr_block = "10.0.0.0/24"
    
    tags = {
      Environment = local.env
      Name = "${local.env}-Public-Subnet"
      Created_by = "sharanya"
    }
}