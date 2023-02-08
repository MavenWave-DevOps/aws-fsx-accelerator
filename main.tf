# -- root/main.tf ---

module "networking" {
  source           = "./networking"
  vpc_cidr         = local.vpc_cidr
  private_sn_count = 2
  max_subnets      = 20
  private_cidrs    = ["10.123.1.0/24", "10.123.2.0/24"]
  access_ip        = var.access_ip
  security_groups  = local.security_groups
}