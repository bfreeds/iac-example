output "vpc_id" {
    description = "The ID of the VPC"
    value = "${module.vpc.vpc_id}"
}

output "public_subnets" {
    description = "List of IDs of public subnets"
    value = "${module.vpc.public_subnets}"
}

output "private_subnet" {
    description = "Private subnet for web servers"
    value = "${module.vpc.private_subnets}"
}


output "database_subnet_group" {
    description = "ID of database subnet group"
    value = "${module.vpc.database_subnet_group}"
}


# Security Group Outputs
output "sg_elb_id" {
    description = "ID of security group for ELB"
    value = "${aws_security_group.elb.id}"
}
output "sg_servers_id" {
    description = "ID of security group for web servers"
    value = "${aws_security_group.servers.id}"
}
output "sg_rds_id" {
    description = "ID of security group for rds"
    value = "${aws_security_group.rds.id}"
}