resource "aws_internet_gateway" "prod-igw" {
    vpc_id = aws_vpc.prod_vpc.id
    tags = {
        Name = "Eng67.Man-Wai.Prod-igw.Terraform"
    }
}

# Public route table
resource "aws_route_table" "prod-public-crt" {
    vpc_id = aws_vpc.prod_vpc.id

    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0"
        //CRT uses this IGW to reach internet
        gateway_id = aws_internet_gateway.prod-igw.id
    }

    tags = {
        Name = "Eng67.Man-Wai.CRT.public.Terraform"
    }
}
//}
//
//# Private Route table
////resource "aws_route_table" "prod-private-crt" {
////    vpc_id = "${aws_vpc.prod-vpc.id}"
////
////    route {
////        //associated subnet can reach everywhere
////        cidr_block = "30.81.1.0/24"
////        //CRT uses this IGW to reach internet
////        gateway_id = "${aws_internet_gateway.prod-igw.id}"
////    }
////
////    tags = {
////        Name = "Eng67.Man-Wai.CRT.Private.Terraform"
////    }
////}
//

# Public route table association
resource "aws_route_table_association" "prod-crta-public-subnet-1"{
    subnet_id = aws_subnet.prod-subnet-public-1.id
    route_table_id = aws_route_table.prod-public-crt.id
}

