variable "private_subnet_cidr1" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_az_zone1" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2b"]
}

variable "private_subnet_name1" {
  type    = list(string)
  default = ["private-subnet-1", "private-subnet-2"]
}

variable "vpc_id" {
    type = string
    default = ""
}
