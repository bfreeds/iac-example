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
    private_subnet = ["10.0.1.0/24"]
    public_subnet = ["10.0.101.0/24"]
    database_subnet = ["10.0.21.0/24", "10.0.22.0/24"]

    # passed to security groups
    server_port = "${var.server_port}"
    DB_PORT = "${var.DB_PORT}"

    
    ### DNS Commented out because domain name not registered
    # elb_dns = "${module.elb.dns_name}"
    # elb_zone_id = "${module.elb.zone_id}"
}

module "elb" {
    source = "../../modules/elb"
    name = "payments-elb"
    subnet = "${module.core.public_subnets}"
    security_groups = ["${module.core.sg_elb_id}"]

    # Attach web instances to ELB
    number_of_instances = "${var.num_servers}"
    instances = ["${module.web.id}"]
}

module "web" {
    source = "../../modules/web"
    environment = "test"
    # basic linux image
    ami = "ami-009d6802948d06e52"
    # free tier
    instance_type = "t2.micro"
    # would be configured across AZs for fault tolerance
    quantity = "${var.num_servers}"

    security_groups = ["${module.core.sg_servers_id}"]
    subnet_id = "${module.core.private_subnet}"
    environment = "test"
}

# MySQL RDS Instance launched private subnet
module "rds" {
  source = "terraform-aws-modules/rds/aws"

  subnet_ids = ["${module.core.database_subnet_group}"]

  identifier = "paymentsdb"
  engine = "mysql"
  engine_version = "8.0.11"
  instance_class = "db.t2.micro" # free tier for testing/dev
  allocated_storage = "2"
  storage_encrypted = true

  name = "paymentsdb"
  username = "${var.DB_USER}"
  password = "${var.DB_PASSWORD}"
  port = "${var.DB_PORT}"
  
  # Restricted to only communicate with web servers
  # on private subnet
  vpc_security_group_ids = ["${module.core.sg_rds_id}"]
  
  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window = "03:00-06:00"

  deletion_protection = true

}
