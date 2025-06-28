variable "vpc_id" {
    type = string

  default = ""
}

variable "natgate_id" {
    type = string

  default = ""
}

variable "rt_cidr" {
  type    = string
  default = "0.0.0.0/0"
}
