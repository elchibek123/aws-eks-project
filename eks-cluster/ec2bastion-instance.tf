module "ec2_bastion" {
  source  = "app.terraform.io/Elchibek/ec2/aws"
  version = "1.0.0"

  instance_name               = "${var.environment}-${var.aws_region}-ec2-bastion-host"
  ami_id                      = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [module.security_group_bastion.security_group_id]
  subnet_id                   = element(module.vpc.public_subnets, 0)
  azs                         = data.aws_availability_zones.available.names
  associate_public_ip_address = true
  key_name                    = var.instance_keypair
  volume_size                 = "8"
  volume_name                 = "${var.environment}-${var.aws_region}-ec2-bastion-volume"
  delete_on_termination       = var.environment != "prod" ? true : false
}