provider "aws" {
  region = "eu-central-1"
}

variable "instance_details" {
    type = map
    default= {
        "prod" = "t2.large"
        "testing" = "t2.nano"
        "dev" = "t2.micro"
        # "devops" = "t2.medium"
    }
  
}


resource "aws_instance" "test" {
    for_each = var.instance_details

    instance_type = each.value
    ami = "ami-0084a47cc718c111a"

    tags ={
        Name = "${each.key} - Instance"
    }
}

output "ip" {
    value = {for name, instance in aws_instance.test : name => {
    id = instance.id 
     type = instance.instance_type
     tags = instance.tags_all
     }}
  
}

