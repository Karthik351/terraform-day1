resource "aws_vpc" "vpc1" {
  
  cidr_block = var.cidr
  tags = {
    Name = "practice VPC"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.vpc1.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
    tags = {
    Name = "Sub1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id = aws_vpc.vpc1.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
    tags = {
    Name = "sub2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc1.id 
    tags = {
    Name = "practice IGW"
  } 
}

resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id

  }  
    tags = {
    Name = "practice RT"
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt1.id
}

resource "aws_route_table_association" "rta2" {
  subnet_id = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rt1.id
}