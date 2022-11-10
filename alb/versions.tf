provider "aws" {
  region  = "us-east-1"
  profile = "mindlogger"

  default_tags {
    tags = {
      Environment = "devops"
      Project     = "MindLogger"
      Management  = "Terraform"
    }
  }

}