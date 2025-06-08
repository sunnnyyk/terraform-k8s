variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_cidr1" {
  type = string

  default = "10.0.0.0/16"
}

variable "cidr_subnet1" {
  type = string

  default = "10.0.1.0/24"
}

variable "subnet_zone1" {
  type = string

  default = "us-east-1a"
}
variable "private_subnet_cidr1" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_az_zone1" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "private_subnet_name1" {
  type    = list(string)
  default = ["private-subnet-1", "private-subnet-2"]
}


variable "ports1" {
  type    = list(number)
  default = [22, 80, 443, 5601, 9200]
}

variable "name1" {
  type    = string
  default = "jenkins-sg"
}




variable "static1" {
  type = map(any)
  default = {
    ami      = "ami-053b0d53c279acc90"
    publicip = true
    keyname  = "test-keypair"
    itype    = "t2.medium"
  }
}
# variable "static2" {
#   type = map(any)
#   default = {
#     ami      = "ami-053b0d53c279acc90"
#     publicip = false
#     keyname  = "ohio"
#     itype    = "t2.medium"
#   }
# }



variable "public_name1" {
  type    = string
  default = "bastion"
}

