provider "aws" {
    region = "eu-central-1"
}

data "aws_vpc" "vpc" {
    default = true
}

locals {
  env_name = "production"
}


variable "test" {
    type = map 
    default = {
        one = 111
        two = 222
        Institute = "DCI"
        date = "2023"
    }
}

resource "aws_instance" "example" {
    count = 2
    instance_type = "t2.micro"
    ami = "ami-0084a47cc718c111a"
    tags = {
        Name = "Instance - ${count.index}"
    }
}

resource "aws_instance" "test" {
    instance_type = "t2.micro"
    ami = "ami-0084a47cc718c111a"
    tags = {
        Name  = "${local.env_name}-Instance"
        Production_Env = local.env_name=="production" ? "yes" : "no" 
        Administrator_info = <<QQQ
        SAA -Sharanya
        DEvops department
        ID : 1234567890
        QQQ   

        Existing_ip = <<ZZZ
        %{for ip in aws_instance.example.*.private_ip}
        server_ip => ${ip}
        %{endfor}
        ZZZ         
    }
}

output "test_tags" {
  
  description = "test instance tags"
  value = aws_instance.test.tags_all
}

output "test_var" {
    value = [for key, value in var.test : upper(key)]
  
}