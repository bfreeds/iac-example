# Network, Security Groups, DNS

# NETWORK
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "markup-vpc-${var.environment}"

  # pass in per environment
  cidr = "${var.cidr}"
  azs = "${var.azs}"

  private_subnets = "${var.private_subnet}"
  public_subnets = "${var.public_subnet}"
  database_subnets = "${var.database_subnet}"

  # single NAT gateway
  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false

  tags = {
    Terraform = true
    Environment = "${var.environment}"
  }
}

# SECURITY GROUPS
resource "aws_security_group" "elb" {
  name = "elb_security_group"
  description = "Allows all inbound traffic"
  vpc_id = "${module.vpc.vpc_id}"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "servers" {
  name = "servers_security_group"
  description = "Communication to/from ELB and internal"
  vpc_id = "${module.vpc.vpc_id}"
  ingress {
    from_port = "${var.server_port}"
    to_port = "${var.server_port}"
    protocol = "http"
    cidr_blocks = ["${var.public_subnet}", "${var.public_subnet}", "${var.database_subnet}"]
  }
}
resource "aws_security_group" "rds" {
  name = "rds_security_group"
  description = "Communication to/from web servers and RDS"
  vpc_id = "${module.vpc.vpc_id}"
  ingress {
    from_port = "${var.DB_PORT}"
    to_port = "${var.DB_PORT}"
    protocol = "tcp"
    cidr_blocks = ["${var.private_subnet}"]
  }
}


# DNS
### COMMENTED OUT BECAUSE I DO NOT HAVE 
### THESE DNS REGISTERED
 
### Create the Primary Zone
# resource "aws_route53_zone" "primary" {
#   name = "themarkup.org"
# }

# ### Create the Subdomain
# resource "aws_route53_record" "payments" {
#   zone_id = "${aws_route53_zone.primary.zone_id}"
#   name = "payments.themarkup.org"
#   type = "A"

#   # alias for ELB DNS
#   alias = {
#     name = "${var.elb_dns_name}"
#     zone_id = "${var.elb_zone_id}"
#     evaluate_target_health = true
#   }
# }

