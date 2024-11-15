provider "aws" {
    region = "eu-central-1"
}

resource "aws_instance" "test" {
    ami = "ami-0084a47cc718c111a"
    instance_type = "t2.micro"
    tags = {
      Name = "Ec2- remote state"
    }
}


