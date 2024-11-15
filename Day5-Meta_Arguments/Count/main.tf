provider "aws" {
  region = "eu-central-1"
}


resource "aws_instance" "test" {
    count = 3 #0-2
    instance_type = "t2.micro"
    ami = "ami-0084a47cc718c111a"
    tags = {
        Name = "Instance-${count.index}"
    }
}


output "public_ip0" {
    description = "1st Ec2 IP: "
    value =  aws_instance.test[*].public_ip
  
}

output "public_ip_for" {
    description = "1st Ec2 IP: "
    value =  [for each_instance in aws_instance.test : each_instance.public_ip ]
  
}

output "example" {
    value = "sharanya"
  
}