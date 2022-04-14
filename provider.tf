terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  profile = "default"
  access_key = var.access_key
  secret_key = var.secret_key
}

