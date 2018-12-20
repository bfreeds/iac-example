# Network, DNS, Security Groups

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "markup-vpc-${var.environment}"

  # pass in per environment
  cidr = "${var.cidr}"
  azs = "${var.azs}"

  private_subnets = "${var.private_subnets}"
  public_subnets = "${var.public_subnets}"
  database_subnets    = "${var.database_subnet}"

  # single NAT gateway
  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false

  tags = {
    Terraform = true
    Environment = "${var.environment}"
  }
}