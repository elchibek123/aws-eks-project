module "vpc" {
  source  = "app.terraform.io/Elchibek/vpc/aws"
  version = "1.0.2"

  cidr_block                 = var.cidr_block
  public_subnets             = var.public_subnets
  private_subnets            = var.private_subnets
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

resource "aws_db_subnet_group" "db_subnet_group" {
  name        = "db-${var.environment}-${var.aws_region}-vpc-subnet"
  description = "Subnet group for the application's RDS instance"
  subnet_ids  = module.vpc.private_subnets[*]

  tags = merge(
    {
      Name = "db-${var.environment}-${var.aws_region}-vpc-subnet"
    }
  )
}