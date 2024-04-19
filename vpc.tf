module "vpc" {
  source  = "app.terraform.io/Elchibek/vpc/aws"
  version = "1.0.1"

  cidr_block                 = var.cidr_block
  public_subnets             = var.public_subnets
  azs                        = data.aws_availability_zones.available.names
  map_public_ip_on_launch    = true
  create_internet_gateway    = true
  create_private_subnets     = true
  create_private_route_table = true
  create_nat                 = true
  create_eip                 = true
  enable_dns_hostnames       = true
  enable_dns_support         = true
  env                        = var.environment
  region_name                = var.aws_region
}