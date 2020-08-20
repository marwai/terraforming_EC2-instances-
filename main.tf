# Creating main file that we will launch our AMI on AWS

# Must tell the file what to do and where we would like to create the instance

# syntax for terraform is similar to json where we use {  }


provider "aws" {
# Which  region do we have the AMI available
    region = "eu-west-1"


}

# Create and instance - launch an instance from the AMI

resource "aws_instance" "app_instance" {
          ami          = var.app_ami_id

# What tpye of ec2 instance we want to create?
          instance_type = "t2.micro"

# Assign public ip?
          associate_public_ip_address = true


# Linking security group to instance
          vpc_security_group_ids = [aws_security_group.HTTP_allowed.id]
          subnet_id = aws_subnet.main.id

          tags = {
              Name = var.name
          }
}


# the "main" is the unique identifier of the resource which is called "aws_subnet"
resource "aws_subnet" "main" {
  vpc_id     = var.vpc_id
  cidr_block = "172.31.182.0/24"

  tags = {
    Name = "Eng67.Man-Wai.Subnet-Public"
  }
}

# security group 
resource "aws_security_group" "HTTP_allowed" {
  name        = "Eng67.Man-Wai.Public-SG"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

# the -1 for protocol refers to
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Eng67.Man-Wai.Public-SG"
  }
}



# create a subnet block of code
# attach this subnet to devopsstudent vpc
# create a security group and attach to VPC
# protocol tcp
# create ingress block of code to allow port 80 and 0.0.0.0/0
# create egress block of code to allow all
