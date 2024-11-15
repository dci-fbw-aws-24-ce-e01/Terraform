terraform {
  required_version = ">=0.12"
}


resource "aws_instance" "ec2_parent" {
    ami =  var.ami #"ami-0084a47cc718c111a"
    instance_type = var.instance_type  #"t2.micro"
    vpc_security_group_ids = [var.sg]
    tags ={
        Name = var.text
    }
  
}