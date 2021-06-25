#VPC
variable "vpc_name" {}
variable "instance_tenancy"{}
variable "cidr" {}

#subnet1
variable "public_subnet"{}

variable "public_subnet_name" {}
  
#Subnet2
variable "private_subnet" {}
variable "private_subnet_name"{}

#Internetgateway
variable "igw_name" {}

#cluster
variable "cluster_name" {}

#nodegroup
variable "node_group_name" {}
variable "desired_size" {}
variable "max_size" {}
variable "min_size" {}
#noderole
variable "node_role" {}
#clusterrole
variable "cluster_role_name" {}
variable "public1_subnet"{}
variable "private1_subnet"{}
variable "availability_zone2"{}
variable "availability_zone1" {}

