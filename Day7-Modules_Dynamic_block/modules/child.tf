provider "aws" {
    region = "eu-central-1"  
}


module "ec2" {
    source = "./module1-ec2"  
    ami = "ami-0084a47cc718c111a"
    # instance_type = "t2.nano"
    sg = module.sg.abcd
    text = module.sg.message
}

module "sg" {
    source = "./module2-sg"
}


