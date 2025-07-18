variable "cluster_name" {}
variable "region" {}
variable "vpc_id" {}
variable "public_subnet_ids" {
  type = list(string)
}
variable "node_group_name" {}
variable "desired_capacity" {
  default = 2
}
variable "max_capacity" {
  default = 2
}
variable "min_capacity" {
  default = 3
}
variable "instance_type" {
  default = "t3.medium"
}
