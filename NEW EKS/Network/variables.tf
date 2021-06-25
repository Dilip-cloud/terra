#VPC
variable "vpc_name" {}
variable "instance_tenancy"{}
variable "cidr" {}

#subnet1
variable "public_subnet"{}
variable "availability_zone1" {}
variable "public_subnet_name" {}
  
#Subnet2
variable "private_subnet" {}
variable "availability_zone2"{}
variable "private_subnet_name"{}

#subnet3
variable "private1_subnet"{}


#subnet4
variable "public1_subnet"{}

#Internetgateway
variable "igw_name" {}
