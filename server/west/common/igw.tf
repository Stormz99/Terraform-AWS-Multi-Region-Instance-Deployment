resource "aws_internet_gateway" "routeGateway" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "${var.igw}-${var.region}"
  }
}