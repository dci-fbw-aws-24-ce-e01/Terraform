terraform {
  backend "s3" {
    bucket = "sharanya-modules-workspaces"
    key = "terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-lock" #LockID
  }
}