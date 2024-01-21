variable "region" {
  type = string
  description = "The region where the resource would be created."
}

variable "environment" {
  type = string
  description = "Environment in which the resource is created."
}

variable "availability_zones" {
  type = list(string)
  description = "The availabilty zones where the resource would be created."
}

variable "public_key" {
  type = string
  # in your command line run 'export TF_VAR_public_key=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com'
  # during terraform apply, it will pick this ssh public key from your system env to create a key pair on aws. 
  # just make sure the private key is renamed to my_key_${var.region}.pem, you'd have two e.g. my_key_eu-west-1.pem and my_key_eu-central-1.pem
  description = "Public key that will be used in creating the RSA key pair on the cloud."
}

variable "internet_cidr" {
  type = string
  description = "CIDR block for the whole internet."
  default = "0.0.0.0/0"
}

variable "vpc_cidr_block" {
  type = string
  description = "The cidr range for the VPC"
}

variable "vpc_name" {
  type = string
  description = "VPC name"
}

variable "subnet_cidr_block" {
  type = list(string)
  description = "List of public and private subnet cidr blocks."
}

variable "subnet_name" {
  type = list(string)
  description = "Subnet name prefixes"
}

variable "igw" {
  type = string
  description = "Name for the internet gateway."
}

variable "subnet_route" {
  type = string
  description = "Name for the route table"
}

variable "security_group_name" {
  type = string
  description = "Name for the security group."
}

variable "ports" {
  type = list(
    object(
      {
      description = string
      port        = number
      }
    )
  )
  description = "A list of ports for the security group."
  default = [
    {
      description = "Allows SSH access"
      port        = 22
    },
    {
      description = "Allows HTTP traffic"
      port        = 80
    },
    {
      description = "Allows HTTPS traffic"
      port        = 443
    }
  ]
}

variable "instance_type" {
  type = string
  description = "The instance type for the instance being provisioned."
}

variable "server_name" {
  type = string
  description = "Name for the server."
}