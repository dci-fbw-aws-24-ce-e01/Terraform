provider "aws" {
    region = "eu-central-1"
}


resource "aws_instance" "test_server" {
    ami = "ami-0084a47cc718c111a"
    instance_type = "t2.micro"
    depends_on = [ aws_s3_bucket.test_storage ]
  
}


resource "aws_s3_bucket" "test_storage" {
    bucket = "terraform-sharanya-12345678"
}

