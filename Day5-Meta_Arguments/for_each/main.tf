# provider "aws" {
#   region = "eu-central-1"
# }


# resource "aws_instance" "test" {
#     for_each ={
#         "prod" = "t2.large"
#         "testing" = "t2.nano"
#         "dev" = "t2.micro"
#         "devops" = "t2.medium"
#     }

#     instance_type = each.value
#     ami = "ami-0084a47cc718c111a"

#     tags ={
#         Name = "${each.key} - Instance"
#     }
# }

# output "ip" {
#     # value = aws_instance.test[*].public_ip
#     value = aws_instance.test["testing"].private_ip
  
# }