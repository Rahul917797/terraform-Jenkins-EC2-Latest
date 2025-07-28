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


