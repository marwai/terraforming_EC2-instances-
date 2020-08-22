provider "aws" {
    region = var.AWS_REGION
}

resource "aws_instance" "web1" {
  ami = var.AMI
  key_name = "DevOpsStudents"
  associate_public_ip_address = true
  instance_type = "t2.micro"

  # VPC
  subnet_id = aws_subnet.prod-subnet-public-1.id

  # Security Group
  vpc_security_group_ids = [
    aws_security_group.web-sg.id]
  tags = {
    Name = "Eng67.Man-Wai.Web.Terraform"
  }
}


//    connection {
//        user = "${var.EC2_USER}"
//        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
//    }
//}
//// Sends your public key to the instance
//resource "aws_key_pair" "Eng67_Man-Wai_key_Terraform" {
//    key_name = "Eng67_Man-Wai_key_Terraform"
//    public_key = "${file(var.PUBLIC_KEY_PATH)}"
//}