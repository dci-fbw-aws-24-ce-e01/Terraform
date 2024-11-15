ami = "ami-0084a47c234567" #Amazon linux
instance_type = "t2.large"
enable_ip = true 

instance_tags = {
  Name = "DCI-production"
  Instance_Number = 10
  date = "5-11-2"
  }

tag_list = [ "first", "second", "third", "fourth" ]

user_names = [ "user1", "user2", "user3" ]