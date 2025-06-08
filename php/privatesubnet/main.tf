resource "aws_subnet" "private-sub" {
  count             = length(var.private_subnet_cidr1)
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidr1[count.index]
  availability_zone = var.private_az_zone1[count.index]

  tags = {
    Name = var.private_subnet_name1[count.index]
  }
}
