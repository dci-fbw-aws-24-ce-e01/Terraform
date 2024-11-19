provider "aws" {
    region = "eu-central-1"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a"]
#   private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  private_subnet_tags = {
    Name = "Sharanya-Private-subnet"
  }

  public_subnet_tags = {
    Name = "Sharanya-Public-subnet"
  }
  
  tags = {
    Name = "Sharanya-VPc"
  }
}