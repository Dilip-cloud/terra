#VPC
vpc_name = "k8-demo"
instance_tenancy = "default"
cidr = "10.0.0.0/16"

#SUBNETS
public_subnet = "10.0.1.0/24"
availability_zone1 = "ap-south-1a"
public_subnet_name = "public"

#subnet2

private_subnet = "10.0.2.0/24"
availability_zone2 = "ap-south-1b"
private_subnet_name = "private"
private1_subnet = "10.0.3.0/24"
public1_subnet = "10.0.4.0/24"

#internet gateway

igw_name = "internetgateway"

#clustername
cluster_name = "demo-k8"

#nodegroup/Workers

node_group_name = "demo-node"
desired_size = "1"
max_size = "1"
min_size = "1"

#noderole

node_role = "node_demo_role"
#clusterrole
cluster_role_name = "cluster_demo_role"

