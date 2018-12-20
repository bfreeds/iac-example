# Setup AWS Provider
provider "aws" {
    region  = "us-east-1"
    profile = "${var.aws_profile}"
}

# Core infrastructure (network, security groups, iam)
module "core" {
    source = "../../modules/core"

    # environment declaration
    environment = "test"

    # network config
    cidr = "10.0.0.0/16"
    azs = ["us-east-1a", "us-east-1b"]
    private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
    public_subnets = ["10.0.101.0/24"]
    database_subnet = ["10.0.21.0/24", "10.0.22.0/24"]
}