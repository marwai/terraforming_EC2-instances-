# Creating variables reuse variables to use main.tf
  variable "vpc_id"  {
     type = string
     default = "vpc-07e47e9d90d2076da"

}

# Using vpc_id variables in main.tf
  variable "name" { 
     type = string
     default = "Eng67.Man-Wai.Terraform.Node.App"
}

  variable "app_ami_id"  {
     type = string
     default = "ami-06575f5007f7bc53e" 
}
