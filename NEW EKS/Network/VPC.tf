resource "aws_vpc" "main" {
  cidr_block       = var.cidr
  instance_tenancy = var.instance_tenancy 

  tags = {
    Name = var.vpc_name
  }
}

#SUBNET1
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet
  availability_zone = var.availability_zone1
  map_public_ip_on_launch = "true"

  tags = {
    
    "kubernetes.io/cluster/demo-k8" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
}

#SUBNET2
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet
  availability_zone = var.availability_zone1
  map_public_ip_on_launch = "true"

  tags = {
    "kubernetes.io/cluster/demo-k8" = "shared"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

#SUBNET3
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private1_subnet
  availability_zone = var.availability_zone2
  map_public_ip_on_launch = "true"

  tags = {
    "kubernetes.io/cluster/demo-k8" = "shared"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

#SUBNET4
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public1_subnet
  availability_zone = var.availability_zone2
  map_public_ip_on_launch = "true"

  tags = {
    
    "kubernetes.io/cluster/demo-k8" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
}

#internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw_name
  }
}

#ELASTIC IP 
resource "aws_eip" "NAT" {
  vpc      = true
}

#NAT 
resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.NAT.id
  subnet_id     = aws_subnet.public.id
}

#Private route
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw.id
  }
}
#Public route 
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "private_nat" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "public_gw" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_nat1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "public_gw1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}
