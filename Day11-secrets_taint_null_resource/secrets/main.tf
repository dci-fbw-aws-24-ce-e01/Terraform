provider "aws" {
    region = "eu-central-1"
}

# terraform {
#   backend "s3" {
#     bucket = "abcd"
#     encrypt = true
#   }
# }

data "aws_secretsmanager_secret_version" "credentials" {
    secret_id = "terraform-cred-sharanya"  
}

#convert the AWS secrets info into the plain text
locals {
  db_creds = jsondecode(data.aws_secretsmanager_secret_version.credentials.secret_string)
}



resource "aws_db_instance" "mydb"{
    db_name = "mydb"
    engine = "postgres"
    engine_version = "15"
    instance_class = "db.t4g.micro"
    allocated_storage = 10
    publicly_accessible = true
    skip_final_snapshot = true

    username = local.db_creds.username #var.username  
    password = local.db_creds.password #var.password
}




# 1. It checks your .tfvars file
# 2. It checks for environment variables
# 3. It prompts the user to provide values via CLI