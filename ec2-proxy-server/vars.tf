variable "ec2_name" {
    default = "proxy"
}

variable "region" {
    default = "eu-central-1b"
}

variable "ami_id" {
  default = "ami-0854da2f8540b70a2" #ami linux arm
}

variable "instance_type" {
  default = "t4g.small"
}

variable "key_name" {
    default = "hoi22"
}

variable "security_group_id" {
    default = ["sg-02b61d6a1dde0601c"] #web+ssh
}

variable "subnet_id" {
    default = "subnet-0904d41da7cc2ad65" #public 10.60.12.x
}
