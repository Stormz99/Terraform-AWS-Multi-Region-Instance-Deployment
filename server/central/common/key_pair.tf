resource "aws_key_pair" "my_key" {
  key_name   = "my_key_${var.region}"
  public_key = var.public_key
}