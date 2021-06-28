

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# terraform {
#   backend "s3" {
#     # Replace this with your bucket name!
    bucket         = "azurepipeline966"
    key            = "terraform/terraform.tfstate"
    region         = "ap-south-1"
#     # Replace this with your DynamoDB table name!
#     dynamodb_table = "terraform_locks9989"
#     encrypt        = true
   

#     # depends_on = [
#     #   aws_s3_bucket.terraform_state_backend,
#     #   aws_dynamodb_table.terraform_locks
#     # ]
#   }
 
# }

module "Network" {
    source = "./Network"
    vpc_name = var.vpc_name
    instance_tenancy = var.instance_tenancy
    cidr = var.cidr
    public_subnet = var.public_subnet
    availability_zone1 = var.availability_zone1
    availability_zone2 = var.availability_zone2
    public_subnet_name = var.public_subnet_name
    private_subnet = var.private_subnet
   # private_zone = var.private_zone
    private_subnet_name = var.private_subnet_name
    igw_name = var.igw_name
    private1_subnet = var.private1_subnet
    public1_subnet = var.public1_subnet

}

module "Cluster" {
    source = "./Cluster"
    cluster_name = var.cluster_name
    subnetA = module.Network.pub_sub_id
    subnetB = module.Network.pvt_sub_id
    cluster_role_name = var.cluster_role_name
}

module "Worker" {
    source = "./Worker"
    node_group_name = var.node_group_name
    desired_size = var.desired_size
    max_size = var.max_size
    min_size = var.min_size
    node_role = var.node_role 
    pub_sub_id = module.Network.pub_sub_id
    pvt_sub_id = module.Network.pvt_sub_id
    cluster_name = var.cluster_name
    depends_on = [ module.Cluster]
}
