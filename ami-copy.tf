provider "aws" {
  region = "eu-central-1"
}

resource "aws_ami_copy" "jenkins1" {
  name              = "jenkins1"
  description       = "jenkins1 ami"
  source_ami_id     = "ami-0b83282d4c7adda4c"
  source_ami_region = "eu-central-1"
  encrypted         = true

  tags = { Name = "jenkins1" }
}

data "aws_ami" "jenkins1" {
  most_recent = true

  owners = ["self"]
}