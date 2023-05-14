provider "aws" {
  region = "ap-southeast-1"
  profile = "default"
}

resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  key_name = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = var.tags
}
