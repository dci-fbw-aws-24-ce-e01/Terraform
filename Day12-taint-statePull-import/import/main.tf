provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0084a47cc718c111a"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform-Instance"
  }
}

resource "aws_instance" "import_instance" {
  ami           = "ami-0084a47cc718c111a"
  instance_type = "t2.micro"
  tags = {
    Name         = "Import-Instance"
    organisation = "DCI"
    author = "sharanya"
  }
}



output "example_ip" {
  value = aws_instance.example.public_ip
}


# terraform import aws_instance.import_instance.i-06aa20282e07f5cb5
# terraform import aws_instance.import_instance i-06aa20282e07f5cb5


