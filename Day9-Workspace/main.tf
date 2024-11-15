provider "aws" {
  region = var.region
}



locals {
    instance_name = "${terraform.workspace}-Instance"
}

resource "aws_instance" "test" {
    ami = var.ami
    instance_type = var.instance_type

    tags = {
      Name = local.instance_name
    }
  
}




#Commands: 
# terraform workspace
# terraform workspace list
# terraform workspace new dev
# terraform workspace show 
# terraform workspace select prod