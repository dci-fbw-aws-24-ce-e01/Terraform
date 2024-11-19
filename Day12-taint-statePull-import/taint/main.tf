provider "aws"{
    region = "eu-central-1"
}

resource "aws_instance" "test_instance" {
    ami= "ami-0084a47cc718c111a" 
    count = 2
    instance_type = "t2.micro"
    tags = {
      Name= "Sharanya- Instance"
    }
}


output "public_ip_1" {
  value = aws_instance.test_instance[0].public_ip
}
output "public_ip_2" {
  value = aws_instance.test_instance[1].public_ip
}

# #taint command -> replacing the resource 
# terraform taint aws_instance.test_instance
# terraform untaint aws_instance.test_instance

# old_public_ip = "3.75.134.170"
# new_public_ip = "3.78.227.152"

# public_ip_1 = "18.195.197.204"
# public_ip_2 = "18.194.101.207" 

# public_ip_1 = "18.195.197.204"
# public_ip_2 = "3.120.210.178"

# public_ip_1 = "52.59.204.226"
# public_ip_2 = "3.120.210.178"
# 
# terraform apply -replace="aws_instance.test_instance[0]"