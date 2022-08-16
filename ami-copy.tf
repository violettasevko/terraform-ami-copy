provider "aws" {
  region = "eu-central-1"
}

resource "aws_ami_copy" "encrypted_ami" {
  name              = "encrypted-ami"
  description       = "An encrypted ami"
  source_ami_id     = "i-0422a40f350f68455"
  source_ami_region = "eu-central-1"
  encrypted         = true

  tags = { Name = "ubuntu-encrypted-ami" }
}

data "aws_ami" "encrypted-ami" {
  most_recent = true

  owners = ["self"]
}