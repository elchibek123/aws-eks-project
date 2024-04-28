module "security_group_bastion" {
  source  = "app.terraform.io/Elchibek/security-group/aws"
  version = "1.0.0"

  sg_name            = "${var.environment}-${var.aws_region}-sg-bastion"
  vpc_id             = module.vpc.vpc_id
  ingress_ports      = ["22"]
  create_cidr_blocks = true
  cidr_blocks        = ["0.0.0.0/0"]
}