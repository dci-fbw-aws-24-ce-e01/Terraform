terraform {
  backend "s3" {
    bucket = "sharanya-terraform-state"
    key= "terraform.tfstate"
    region = "eu-central-1"
    encrypt = true
  }
}

provider "aws"{
    region = "eu-central-1"
}

locals {
  instance_tag = "${terraform.workspace}-instance"
}

resource "aws_instance" "test" {
    ami = "ami-0084a47cc718c111a"
    count =2 
    instance_type = "t2.micro"
    tags = {
      Name = local.instance_tag
    }
}

#terraform state pull 
#terraform state pull >> test.tfstate