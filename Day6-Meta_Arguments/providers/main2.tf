provider "aws" {
  region     = "us-west-2"
  alias      = "production"
#   access_key = "PROD_ACCESS_KEY"
#   secret_key = "PROD_SECRET_KEY"
}

provider "aws" {
  region     = "us-west-2"
  alias      = "development"
  profile = sharanya    
#   access_key = "DEV_ACCESS_KEY"
#   secret_key = "DEV_SECRET_KEY"
}

resource "aws_s3_bucket" "prod_bucket" {
  provider = aws.production
  bucket   = "my-prod-bucket"

  tags = {
    Name = "Production Bucket"
    Env  = "Production"
  }
}

resource "aws_s3_bucket_acl" "prod_bucket_acl" {
  provider = aws.production
  bucket   = aws_s3_bucket.prod_bucket.id
  acl      = "private"
}

resource "aws_s3_bucket" "dev_bucket" {
  provider = aws.development
  bucket   = "my-dev-bucket"

  tags = {
    Name = "Development Bucket"
    Env  = "Development"
  }
}

resource "aws_s3_bucket_acl" "dev_bucket_acl" {
  provider = aws.development
  bucket   = aws_s3_bucket.dev_bucket.id
  acl      = "private"
}
