region="eu-west-1"
environment="prod"
availability_zones=[ "eu-west-1a", "eu-west-1b" ]
# public_key = in your command line run 'export TF_VAR_public_key=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com'
# during terraform apply, it will pick this ssh public key from your system env to create a key pair on aws. 
# just make sure the private key is renamed to my_key_${var.region}.pem, you'd have two e.g. my_key_eu-west-1.pem and my_key_eu-central-1.pem
vpc_cidr_block="173.10.0.0/15"
vpc_name="tfVPC"
subnet_cidr_block=[ "173.10.0.0/14", "173.10.2.0/14" ]
subnet_name=[ "public", "private" ]
igw="tfIGW"
subnet_route="tfSubnetRoute"
security_group_name="tfSG"
ports=[
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
instance_type="t2.micro"
server_name="tfPublicServer"