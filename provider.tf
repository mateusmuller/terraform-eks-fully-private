terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.74.0"
    }
  }
  backend "s3" {
    bucket = "terraform-eks-fully-private-state"
    key = "state"
    region = "us-east-2"
  }
}

provider "aws" {
  region = terraform.workspace == "dev" ? "us-east-2" : "sa-east-1"
}