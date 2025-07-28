terraform {
  backend "s3" {
    bucket = "myprivatebucket-05011997-28072025"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "private_s3_bucket" {
  bucket = "myprivatebucket-05011997-28072025"

  tags = {
    Name        = "Java_Banking"
    Version     = "5-0-3-2"
    Owner       = "Rahul"
    Environment = "Testing"
  }
}

resource "aws_s3_bucket_public_access_block" "block_bucket" {
  bucket = aws_s3_bucket.private_s3_bucket.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}
