terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = var.region
  #profile = "some-profile"

  default_tags {
    tags = {
      terraform = "true"
    }
  }
}