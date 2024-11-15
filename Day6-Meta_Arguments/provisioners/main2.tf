provider "aws" {
    region = "eu-central-1"

}

resource "aws_instance" "test_server1" {
    ami = "ami-0084a47cc718c111a"
    instance_type = "t2.micro"
    key_name = "pem-key-pair"
    

    connection {
      type = "ssh"
      host = self.public_ip
      user= "ubuntu"
      private_key = file("C:\\Users\\dci-student\\Documents\\DCI-Classes\\AWS_CE24_E01\\AWS_Reference_Scripts\\key-pairs\\pem-key-pair.pem")
    #   timeout = "10m"
    }

    provisioner "file" {
        source = "Notes.txt"
        # content = "This is Sharanya, file is created using terraform provisioners"
        destination = "/home/ubuntu/Notes.txt"      
    }

    tags = {
        Name = "EU-Instance"
    } 
}

output "public_ip" {
    value = aws_instance.test_server1.public_ip  
}



