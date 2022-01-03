terraform {
  backend "s3" {
    bucket         = "mathops.terraform.bucket"
    key            = "mathops.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "mathops.terraform.dynamotable"
  }
}

provider "aws" {
  region = "eu-central-1"
}