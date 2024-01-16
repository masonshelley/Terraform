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

resource "aws_instance" "instance_example" {
    ami           = "ami-00b8917ae86a424c9"
    instance_type = "t2.micro"


  tags = {
    name = var.instance_name
  }
}

