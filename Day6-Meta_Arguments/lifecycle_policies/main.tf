provider "aws" {
    region = "eu-central-1"
}


# ami-0eddb4a4e7d846d6f


resource "aws_instance" "test_server1" {
    # ami = "ami-0084a47cc718c111a"
    ami = "ami-0eddb4a4e7d846d6f"
    instance_type = "t2.micro"
    lifecycle {
    #   create_before_destroy = true
    #   prevent_destroy = true
    ignore_changes = [ tags, ]
    }
    tags = {
        Name = "EU-Instance"
    } 

}


