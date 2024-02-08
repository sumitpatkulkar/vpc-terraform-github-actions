module "vpc" {
  source = "./Modules/vpc"
  vpc_cidr = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "sg" {
  source = "./Modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./Modules/ec2"
  sg_id = module.sg.sg_id
  subnets = module.vpc.subnets_ids
}

module "alb" {
  source = "./Modules/alb"
  sg_id = module.sg.sg_id
  subnets = module.vpc.subnets_ids
  vpc_id = module.vpc.vpc_id
  instaces = module.ec2.instances
}