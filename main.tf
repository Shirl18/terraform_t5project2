#VPC
resource "aws_vpc" "main"{
    cidr_block = var.vpc_cidr
}

#Internet gateway
resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id
}

#Subnet
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    availability_zone = var.AZ
    cidr_block = var.subnet1_cidr_block
    map_public_ip_on_launch = true
}

#Route Table
resource "aws_route_table" "public"{
    vpc_id = aws_vpc.main.id
}

resource "aws_route" "name" {
    route_table_id = aws_route_table.public.id
    destination_cidr_block = var.destination_cidr_block
    gateway_id = aws_internet_gateway.main.id
}

#Route association
resource "aws_route_table_association" "public"{
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
}

#EC2 Instance attached to subnet
resource "aws_instance" "T5" {
    ami         = data.aws_ami.linux2.id
    instance_type = var.instance_type
    count = 2
    subnet_id = aws_subnet.public.id
}