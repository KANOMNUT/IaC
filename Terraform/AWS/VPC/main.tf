provider "aws" {
  region = "ap-southeast-1"
  profile = "default"
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = var.tag_vpc
}

resource "aws_internet_gateway" "kanomnutt-gw" {
  vpc_id = aws_vpc.vpc.id
  tags = var.tag_gw
}

resource "aws_subnet" "kanomnutt-sub" {
  vpc_id = aws_vpc.vpc.id
  count = length(var.subnet_cidr)
  cidr_block = var.subnet_cidr[count.index]
  tags = var.tag_subnet
}

resource "aws_security_group" "kanomnutt-sg" {
  name = "kanomnutt-sg"
  vpc_id = aws_vpc.vpc.id
  tags = var.tag_sg
   /* Allow only ssh traffic from internet */
  ingress {
    from_port = "22"
    to_port   = "22"
    protocol  = "TCP"
    self      = true
    cidr_blocks      = ["0.0.0.0/0"]
  }

  /* Allow all outbound traffic to internet */
  egress {
    from_port        = "0"
    to_port          = "0"
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}
