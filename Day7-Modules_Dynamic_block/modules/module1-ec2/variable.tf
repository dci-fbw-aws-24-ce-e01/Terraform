variable "ami" {
    type = string
    description = "EC2 Image id"  
}

variable "instance_type" {
    type = string
    description = "EC2 Instance type"  
    default = "t2.medium"
}


variable "sg" {
    type = string
    description = "The security group of ec2"
  
}

variable "text" {
    type = string
    description = "some message"
  
}