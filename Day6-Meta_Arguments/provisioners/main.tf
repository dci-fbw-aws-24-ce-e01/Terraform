# provider "aws" {
#     region = "eu-central-1"
# }

# resource "aws_instance" "test_server1" {
#     ami = "ami-0084a47cc718c111a"
#     instance_type = "t2.micro"
#     # key_name = "pem-key-pair"
   
#     provisioner "local-exec" {
#         command = "echo ${self.public_ip} > /home/dci-user/public_ip.txt"  
#     }

#     tags = {
#         Name = "EU-Instance"
#     } 
# }




