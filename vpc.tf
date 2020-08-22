

# Creating a VPC
resource "aws_vpc" "prod_vpc" {
    cidr_block = "30.81.0.0/16"
    enable_dns_support = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name
    enable_classiclink = "false"
    instance_tenancy = "default"

    tags = {
        Name = "Eng67.Man-Wai.VPC.Terraform"
    }
}

# Creating public subnet
resource "aws_subnet" "prod-subnet-public-1" {
    vpc_id = aws_vpc.prod_vpc.id
    cidr_block = "30.81.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "eu-west-1a"
    tags = {
        Name = "Eng67.Man-Wai.Public.Subnet.Terraform"
    }
}
//
//# Creating private subnet
////resource "aws_subnet" "prod-subnet-private-1" {
////    vpc_id = "${aws_subnet.prod-subnet-private-1.id}"
////    cidr_block = "30.81.2.0/24"
////    map_public_ip_on_launch = "true" //it makes this a public subnet
////    availability_zone = "eu-west-1"
////    tags {
////        Name = "Eng67.Man-Wai.Public.Subnet.Terraform"
////    }
////}
//
//
//# Creating instances
////resource "aws_instance" "web1" {
////    ami = "${lookup(var.AMI, var.AWS_REGION)}"
////    instance_type = "t2.micro"
////    # VPC
////    subnet_id = "${aws_subnet.prod-subnet-public-1.id}"
////    # Security Group
////    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
////    # the Public SSH key
////    key_name = "${aws_key_pair.london-region-key-pair.id}"
////    # nginx installation
////    provisioner "file" {
////        source = "nginx.sh"
////        destination = "/tmp/nginx.sh"
////    }
////    provisioner "remote-exec" {
////        inline = [
////             "chmod +x /tmp/nginx.sh",
////             "sudo /tmp/nginx.sh"
////        ]
////    }
////    connection {
////        user = "${var.EC2_USER}"
////        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
////    }
////}
////// Sends your public key to the instance
////resource "aws_key_pair" "london-region-key-pair" {
////    key_name = "london-region-key-pair"
////    public_key = "${file(var.PUBLIC_KEY_PATH)}"
////}
//
