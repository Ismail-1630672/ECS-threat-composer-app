output "vpc_id" {
    description = "the id value of the VPC"
    value = aws_vpc.my_vpc.id
}

output "igw" {
    description = "the id of the internet gateway"
    value = aws_internet_gateway.gw.id 
}

output "public_subnet1_id" {
    description = "the id of the first public subnet"
    value = aws_subnet.public_subnet1.id
}

output "public_subnet2_id" {
    description = "the id of the second public subnet"
    value = aws_subnet.public_subnet2.id
    
}

output "route_table_id" {
    description = "The id of the route table"
     value = aws_route_table.public_route_table.id 
}