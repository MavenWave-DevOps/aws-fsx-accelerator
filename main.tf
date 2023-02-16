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

module "awsfsx" {
  source                               = "./fsx"
  refresh_token                        = var.refresh_token
  aws_connector_deploy_bool            = false
  fsx_name                             = "fsx_test"
  fsx_region                           = var.aws_region
  fsx_primary_subnet_id                = module.networking.fsx_primary_subnet_id
  fsx_secondary_subnet_id              = module.networking.fsx_secondary_subnet_id
  fsx_account_id                       = var.fsx_account_id
  fsx_workspace_id                     = var.fsx_workspace_id
  fsx_throughput_capacity              = "512"
  fsx_storage_capacity_size            = "1"
  fsx_storage_capacity_size_unit       = "TiB"
  fsx_admin_password                   = var.fsx_admin_password
  fsx_cloudmanager_aws_credential_name = var.fsx_cloudmanager_aws_credential_name
}