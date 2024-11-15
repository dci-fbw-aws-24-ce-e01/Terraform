variable "ami" {
    description = "Ec2 image id"
    type = string  
}


variable "instance_type" {
    description = "Ec2 instane type"
    type= string
    default = "t2.nano"
}

variable "enable_ip" {
    description = "Enable public IP to EC2 "
    type = bool
    default = false
}


variable "instance_tags" {
    type = object({
      Name = string
      Instance_Number = number
      date = string
    })
  
}

variable "tag_list"{
    description = "Individual tag values"
    type = list(string)
}

variable "user_names" {
    description = "IAM usernames"
    type = list(string)
    default = ["user1", "user2"]
  
}