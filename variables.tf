# Creating variables reuse variables to use main.tf

# AWS region
variable "AWS_REGION" {
    default = "eu-west-1"

}

variable "AMI" {
    type = string
    default = "ami-06575f5007f7bc53e"
}























//variable "vpc_id"  {
//     type = string
//     default = "vpc-07e47e9d90d2076da"
//
//}

# Using vpc_id variables in main.tf
//  variable "name" {
//     type = string
//     default = "Eng67.Man-Wai.Terraform.Node.App"
//}

# 1st Iteration
//variable "AMI" {
//    type = "map"
//
//    default = {
//        eu-west-1 = "ami-06a48e18770730729"
//    }
//}

# For 2nd Iteration
# AMI bastion, DB and App in respective order
//variable "AMI_bastion" {
//    type = "map"
//    default {
//        eu-west-1 = "ami-0268287a207ef8b95"
//    }
//}
//
//variable "AMI_db" {
//    type = "map"
//    default {
//        eu-west-1 = "ami-06a48e18770730729"
//    }
//}
//
//variable "AMI_app" {
//    type = "map"
//    default {
//        eu-west-1 = "ami-06575f5007f7bc53e"
//    }
//}
//

