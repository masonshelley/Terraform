terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.3"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

module "EC2" {
  source = "./Modules/EC2"
}
module "S3" {
  source = "./Modules/S3"
}
module "AWS_SG" {
  source = "./Modules/AWS_SG"
}