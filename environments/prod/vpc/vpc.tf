locals{
  project = "vprofile"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.0" 

  name = var.vpc_name
  cidr = var.vpc_cidr
  azs = var.azs
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets

  enable_nat_gateway = true
  # enable_vpn_gateway = true
  create_igw = true
  single_nat_gateway = true

  tags = {
    Project = local.project
  }
}
