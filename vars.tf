variable "ec2_name" {
    default = "proxy"
}

variable "region" {
    default = "eu-central-1"
}

variable "ami_id" {
  default = "ami-0ceb85bb30095410b"
}

variable "instance_type" {
  default = "t4g.small"
}

variable "key_name" {
    default = "hoi22"
}

variable "security_group_id" {
    default = ["sg-019219fc96bf5722b", "sg-019219fc96bf57227"]
}

variable "subnet_id" {
    default = ""
}
