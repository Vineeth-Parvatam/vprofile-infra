output "name" {
    description = "The name of the VPC"
    value      = module.vpc.name
}
output "id" {
    description = "The ID of the VPC"
    value      = module.vpc.vpc_id
}
output "public_subnets" {
    description = "List of public subnet IDs"
    value      = module.vpc.public_subnets
}
output "private_subnets" {
    description = "List of private subnet IDs"
    value      = module.vpc.private_subnets
}
output "natgw_ids" {
    description = "List of NAT Gateway IDs"
    value      = module.vpc.natgw_ids
}
output "igw_id" {
    description = "The ID of the Internet Gateway"
    value      = module.vpc.igw_id
}
output "vpc_cidr_block" {
    description = "The CIDR block of the VPC"
    value      = module.vpc.vpc_cidr_block
}
output "azs" {
    description = "The availability zones used in the VPC"
    value      = module.vpc.azs
}
output "default_security_group_id" {
    description = "The ID of the default security group of the VPC"
    value      = module.vpc.default_security_group_id
}
output "vpc_private_route_table_ids" {
    description = "List of private route table IDs in the VPC"
    value      = module.vpc.private_route_table_ids
}
output "vpc_public_route_table_ids" {
    description = "List of public route table IDs in the VPC"
    value      = module.vpc.public_route_table_ids
}
output "vpc_private_subnet_cidrs" {
    description = "List of private subnet CIDR blocks"
    value      = module.vpc.private_subnets_cidr_blocks
}
output "vpc_public_subnet_cidrs" {
    description = "List of public subnet CIDR blocks"
    value      = module.vpc.public_subnets_cidr_blocks
}

output "vpc_default_seurity_group_id" {
    description = "The ID of the default security group of the VPC"
    value      = module.vpc.default_security_group_id
}