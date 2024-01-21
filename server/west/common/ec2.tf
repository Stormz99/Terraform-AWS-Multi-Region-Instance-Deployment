data "aws_ami" "ubuntu_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "public_server" {
  ami = data.aws_ami.ubuntu_ami.id
  instance_type = var.instance_type
  key_name = aws_key_pair.my_key.key_name
  subnet_id = aws_subnet.publicSubnet.id
  vpc_security_group_ids = [ aws_security_group.securityGroup.id ]
  associate_public_ip_address = true
  user_data = file("deploy.sh")

 #  provisioner "local-exec" {
    # command = <<-EOT
   # ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook main.yml
    # EOT
    # environment = {
      # ANSIBLE_HOST_KEY_CHECKING = "False"
    # }
  # }
  tags = {
    Name = "${var.server_name}-${var.environment}"
  }
}