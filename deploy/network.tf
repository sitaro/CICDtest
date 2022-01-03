resource "aws_vpc" "mathops_vpc" {
  cidr_block = var.mathops_vpc_cidr

  tags = {
    Name = "mathops-vpc"
  }
}

resource "aws_subnet" "mathops_public_subnet" {
  vpc_id     = aws_vpc.mathops_vpc.id
  cidr_block = var.mathops_public_cidr

  tags = {
    Name = "mathops_public_net"
  }
}

resource "aws_internet_gateway" "mathops_igw" {
  vpc_id = aws_vpc.mathops_vpc.id

  tags = {
    Name = "mathops_igw"
  }
}

resource "aws_route_table" "mathops_default_rt" {
  vpc_id = aws_vpc.mathops_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mathops_igw.id
  }

  tags = {
    Name = "mathops_default_route"
  }
}

resource "aws_route_table_association" "mathops_default_rta" {
  subnet_id      = aws_subnet.mathops_public_subnet.id
  route_table_id = aws_route_table.mathops_default_rt.id
}