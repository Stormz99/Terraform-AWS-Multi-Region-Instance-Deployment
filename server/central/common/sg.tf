resource "aws_security_group" "securityGroup" {
  name = var.security_group_name
  vpc_id = aws_vpc.my_vpc.id

  dynamic "ingress" {
    for_each = var.ports
    content {
        description = ingress.value["description"]
        from_port = ingress.value["port"]
        to_port = ingress.value["port"]
        protocol = "tcp"
        cidr_blocks = [var.internet_cidr[0]]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.internet_cidr[0]]
  }

  tags = {
    Name = "${var.security_group_name}-${var.region}"
  }
}