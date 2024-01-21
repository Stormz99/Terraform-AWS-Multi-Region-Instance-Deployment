resource "aws_subnet" "publicSubnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr_block[0]
  availability_zone = var.availability_zones[0]
  tags = {
    Name = "${var.subnet_name[0]}-${var.region}"
  }
}

resource "aws_subnet" "privateSubnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr_block[1]
  availability_zone = var.availability_zones[1]
  tags = {
    Name = "${var.subnet_name[1]}-${var.region}"
  }
}