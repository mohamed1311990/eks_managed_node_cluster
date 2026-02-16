module "vpc" {
  source = "../../modules/vpc"

  name   = var.name
  region = var.region
  env    = var.env
}

module "eks" {
  source = "../../modules/eks"

  name       = var.name
  env        = var.env
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
}
