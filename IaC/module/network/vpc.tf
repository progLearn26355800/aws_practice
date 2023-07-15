resource aws_vpc main_vpc {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    tags = {
        Name = "handson-vpc"
    }
}

resource aws_subnet public_subnet_1a {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = var.az_a

    depends_on = [
        aws_vpc.main_vpc
        ]
    tags = {
        Name = "handson-public-subnet-1a"
    }
}

resource aws_subnet private_subnet_1a {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = var.az_a
    depends_on = [
        aws_vpc.main_vpc
        ]
    tags = {
        Name = "handson-private-subnet-1a"
    }
}


resource aws_internet_gateway igw {
    vpc_id = aws_vpc.main_vpc.id
    tags = {
        Name = "handson-igw"
    }
    depends_on = [
        aws_vpc.main_vpc
        ]
}

resource aws_route_table public_rt {
    vpc_id = aws_vpc.main_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    depends_on = [
        aws_vpc.main_vpc
    ]
    tags = {
        Name = "handson-route_table"
    }
}

resource aws_route_table_association public_rt_associate {
    subnet_id = aws_subnet.public_subnet_1a.id
    route_table_id = aws_route_table.public_rt.id
    depends_on = [
        aws_subnet.public_subnet_1a
    ]
}
