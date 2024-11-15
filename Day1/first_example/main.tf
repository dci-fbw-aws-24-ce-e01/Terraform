provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "test_ec2" {       # "aws_instance"  == AWS::EC2::Instance
  ami                     = "ami-0084a47cc718c111a"
  instance_type           = "t2.micro"
}