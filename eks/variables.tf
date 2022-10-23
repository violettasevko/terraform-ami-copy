variable "cluster_name" {
 type    = string
 default = "cluster1"
}

variable "cluster_version" {
 type    = string
 default = "1.23"
}

variable "subnet_ids" {
 type    = list(string)
 default = ["subnet-0101545d43a467f5b", "subnet-058e500f0b866e68b"]
}
