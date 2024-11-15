provider "aws" {
    region = "eu-central-1"
}


data "aws_vpc" "existing_vpc" {
    # default = true
    filter {
      name = "tag:date"
      values = ["5-11-24"]
    }
}


resource "aws_subnet" "public_subnet"{
    vpc_id = data.aws_vpc.existing_vpc.id 
    cidr_block = "10.0.0.0/24"
}


output "existing_vpc" {
    value =data.aws_vpc.existing_vpc.id
}