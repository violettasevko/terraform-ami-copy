variable "ec2_name" {
  description   = "Name for EC2 instance"
  type          = string
}

variable "ami_id" {
    description = "AMI id for instance"
    type        = string
}

variable "instance_type" {
    description = "Type of EC2 instance"
    type        = string
}

variable "region" {
    description = "Region for EC2 instance"
    type        = string
}

variable "key_name" {
    description = "Name of key for EC2 instance"
    type        = string
}

variable "security_group_id" {
    description = "Name of key for EC2 instance"
    type        = list(string)
}

variable "subnet_id" {
    description = "Name of key for EC2 instance"
    type        = string
}

