provider "aws" {
  region  = "us-east-1"
  profile = "aaa"

  default_tags {
    tags = {
      Environment = "devops"
      Project     = "aaa"
      Management  = "Terraform"
    }
  }

}
