provider "aws" {
    region = "eu-central-1"
}


resource "aws_s3_bucket" "test_bucket" {
    bucket = var.bucket_name
    provisioner "local-exec" {
      when = destroy 
      command = "aws s3 rm s3://${self.bucket} --recursive "
    }
}


resource "aws_dynamodb_table" "lock_table" {
  name             = "terraform-lock"
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"
 
  attribute {
    name = "LockID"
    type = "S"
  }
}
  
