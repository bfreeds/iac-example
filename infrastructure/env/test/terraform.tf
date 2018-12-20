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
    public_cidr = "10.0.101.0/24"
    private_web_cidr = "10.0.1.0/24"
    private_db_cidr = "10.0.2.0/24"
}