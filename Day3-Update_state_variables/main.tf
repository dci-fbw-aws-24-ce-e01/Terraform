#Configuration file

provider "aws" {
    region = "eu-central-1"
}

variable "instance_type" {
    description = "Enter the EC2 instance type"
    default = "t2.micro"
    type = string
  
}

variable "ami_id"{
    description = "Enter the EC2 AMI ID"
}




resource "aws_instance" "my_instance" {
  ami                     = var.ami_id           #"ami-0084a47cc718c111a"
  instance_type           = var.instance_type
  tags = {
    Name = "Sharanya-Ec2Instance"
  }
}


output "ec2_public_ip" {
    description = "Public IP address of the EC2 instance"
    value = aws_instance.my_instance.public_ip  

}

# terraform apply --auto-approve