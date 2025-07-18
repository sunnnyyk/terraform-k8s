module "vpc" {
  source   = "./vpc"
  vpc_cidr = var.vpc_cidr1

}
module "internet" {
  source = "./internetgateway"
  vpc_id = module.vpc.vpc_id

}
module "publicroute" {
  source            = "./publicroutetable"
  intnet_gateway_id = module.internet.intnet_gateway_id
  vpc_id            = module.vpc.vpc_id
}
module "prouteassign" {
  source      = "./publicrouteassign"
  sub_id      = module.subnet.sub_id
  pubtable_id = module.publicroute.pubtable_id
}


module "subnet" {
  source      = "./subnet"
  cidr_subnet = var.cidr_subnet1
  subnet_zone = var.subnet_zone1
  vpc_id      = module.vpc.vpc_id
}


module "natgt" {
  source = "./natgateway"
  sub_id = module.subnet.sub_id

}

module "private_route" {
  source     = "./privateroutetable"
  vpc_id     = module.vpc.vpc_id
  natgate_id = module.natgt.natgate_id
  # privatesub_id = module.privatesubnet.privatesub_id

}

module "prirouteassign" {
  source        = "./privaterouteassign"
  privatesub_id = module.privatesubnet.privatesub_id
  rt_id         = module.private_route.rt_id
}

module "privatesubnet" {
  source = "./privatesubnet"
  # private_subnet_cidr = var.private_subnet_cidr1
  # private-az_zone     = var.private-az_zone1
  # private-subnet-name = var.private-subnet-name1
  vpc_id = module.vpc.vpc_id
}

module "security" {
  source  = "./securitygroup"
  name-sg = var.name1
  # ports  = var.ports1
  vpc_id = module.vpc.vpc_id
}


module "instance_public" {
  source      = "./publicinstance"
  sub_id      = module.subnet.sub_id
  public_name = var.public_name1
  static      = var.static1
  security_id = module.security.security_id
}


module "eks" {
  source            = "./eks"
  cluster_name      = "my-eks-o-cluster"
  region            = "us-east-1"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.privatesubnet.privatesub_id
  node_group_name   = "my-eks-one-nodes"
  instance_type     = "t3.medium"
  desired_capacity  = 1
  min_capacity      = 1
  max_capacity      = 1
}


