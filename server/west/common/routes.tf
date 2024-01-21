resource "aws_route_table" "subnetRoute" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "${var.subnet_route}-${var.region}"
  }
}

resource "aws_route_table_association" "publicSubnetRouteAssociation" {
  subnet_id = aws_subnet.publicSubnet.id
  route_table_id = aws_route_table.subnetRoute.id
}

resource "aws_route" "internetRoute" {
  gateway_id = aws_internet_gateway.routeGateway.id
  route_table_id = aws_route_table.subnetRoute.id
  destination_cidr_block = var.internet_cidr[0]
}