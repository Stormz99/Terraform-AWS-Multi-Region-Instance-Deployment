resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  instance_tenancy = "default"
  tags = {
    Name = "${var.vpc_name}-${var.region}"
  }
}