provider "aws" {
  region = "eu-central-1"
}


resource "aws_instance" "test" {
  ami = "ami-0084a47cc718c111a"
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo Hello from Sharanya via EC2 resource"
  }
}

#logging 
resource "null_resource" "example" {
    provisioner "local-exec" {
        command = "echo Hello >> file.txt"
    }

    provisioner "local-exec" {
        command = "echo ${aws_instance.test.public_ip} >> public_ip.txt"
    }

     provisioner "local-exec" {
        command ="echo ${aws_instance.test.private_ip} >> private_ip.txt"
    }

}

# provisioner : file, local-exec, remote-exec



#Log info:
# $Env:TF_LOG = "TRACE"    # trace, debug, info, warn, error
# $Env:TF_LOG = "WARN"    # trace, debug, info, warn, error
# $Env:TF_LOG = "ERROR"    # trace, debug, info, warn, error

#Log file:
# $Env:TF_LOG_PATH = ".\terraform.log"
