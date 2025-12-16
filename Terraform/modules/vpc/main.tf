#create virtual private cloud resource
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

#create internet gateway and attatch it to vpc
resource aws_internet_gateway "gw" {
    vpc_id = aws_vpc.my_vpc.id

    tags = {
      Name = "${var.project_name}-igw"
    }
}

#declare data source to get availability zones in region
data "aws_availability_zones" "available" {
  
}

#create public subnets
resource aws_subnet "public_subnet1" {
    #any resource launched in this subnet will have a public IP
    map_public_ip_on_launch = true 
    vpc_id = aws_vpc.my_vpc.id 
    cidr_block = var.public_subnet1_cidr
    #indexing to select first az in region
    availability_zone = data.aws_availability_zones.available.names[0] 

    tags = {
      Name = "${var.project_name}-public1"
    }
    

}

resource aws_subnet "public_subnet2" {
    map_public_ip_on_launch = true 
    vpc_id = aws_vpc.my_vpc.id 
    cidr_block = var.public_subnet2_cidr
    availability_zone = data.aws_availability_zones.available.names[1] 

    tags = {
      Name = "${var.project_name}-public2"
    }
    

}

#create vpc routing table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.project_name}-publicrt"
  }

}

#associate public subnets to route table
resource "aws_route_table_association" "public_route1" {
  subnet_id = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_route_table.id

}

resource "aws_route_table_association" "public_route2" {
  subnet_id = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}