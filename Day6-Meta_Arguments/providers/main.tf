provider "aws" {
    region = "eu-central-1"
}

provider "aws" {
    region = "us-east-1"
    alias = "sharanya"
  
}

resource "aws_instance" "test_server1" {
    ami = "ami-0084a47cc718c111a"
    instance_type = "t2.micro"
    tags = {
        Name = "EU-Instance"
    } 
}


resource "aws_instance" "test_server2" {
    provider = aws.sharanya
    ami = "ami-0866a3c8686eaeeba"
    instance_type = "t2.micro"
    tags = {
        Name = "US-Instance"
    }
}

