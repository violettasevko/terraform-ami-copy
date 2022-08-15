provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "name"
    values = ["ubuntu-minimal/images/hvm-ssd/ubuntu-focal-20.04-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_ami_copy" "ubuntu_encrypted_ami" {
  name              = "ubuntu-encrypted-ami"
  description       = "An encrypted root ami based off ${data.aws_ami.ubuntu.id}"
  source_ami_id     = data.aws_ami.ubuntu.id
  source_ami_region = "eu-west-2"
  encrypted         = true

  tags = { Name = "ubuntu-encrypted-ami" }
}

data "aws_ami" "encrypted-ami" {
  most_recent = true

  filter {
    name   = "name"
    values = [aws_ami_copy.ubuntu_encrypted_ami.id]
  }

  owners = ["self"]
}