provider "aws" {
    region = "eu-central-1"
}

resource "aws_instance" "test" {
    ami = "ami-0084a47cc718c111a"
    instance_type = "t2.micro"
    tags = {
      Name = "Ec2- remote state - from developer 1 "
    }
}


terraform{
    backend "s3" {
        bucket = "terraform-remote-sharanya"
        key = "remote-state-files/terraform.tfstate"
        region = "eu-central-1" 
        dynamodb_table = "dynamodb-state-locking"     
    }
}