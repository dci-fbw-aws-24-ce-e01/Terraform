provider "aws" {
    region = "eu-central-1"
}


resource "aws_instance" "example_instance" {
    ami = var.ami 
    instance_type = var.instance_type  
    associate_public_ip_address = var.enable_ip
    tags = {
        Name = var.instance_tags.Name
        Instance_Number = var.tag_list[2]
    }
}


resource "aws_iam_user" "example_iam" {
   count = length(var.user_names) # length only works if varibale is of type list
   name = var.user_names[count.index]
}
