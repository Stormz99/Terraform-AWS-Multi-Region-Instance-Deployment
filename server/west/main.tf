module "common" {
  source = "./common"
  region = var.region
  environment = var.environment
  vpc_name = var.vpc_name
  vpc_cidr_block = var.vpc_cidr_block
  igw = var.igw
  subnet_cidr_block = var.subnet_cidr_block
  subnet_name = var.subnet_name
  subnet_route = var.subnet_route
  security_group_name = var.security_group_name
  availability_zones = var.availability_zones
  public_key = var.public_key
  instance_type = var.instance_type
  server_name = var.server_name
}