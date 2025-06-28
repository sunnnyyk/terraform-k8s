variable "public_name" {
  type    = string
  default = "ninja"
}

variable "static" {
  type = map(any)
  default = {
    ami      = "ami-05f991c49d264708f"
    publicip = true
    keyname  = "ab"
    itype    = "t3.2xlarge"
  }
}


variable "sub_id" {
  type = string
 
}

variable "security_id" {
  type    = string
  default = ""
}
