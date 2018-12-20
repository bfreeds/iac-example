# Network, DNS, Security Groups

resource "aws_vpc" "main" {
  cidr_block = "${var.cidr}"
  enable_dns_support = "${var.dns}"
  enable_dns_hostnames = "${var.dnsh}"

  tags = {
      Name = "main-vpc"
      Environment = "${var.environment}"
  }
}

# public subnet for elb
resource "aws_subnet" "public" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${var.public_cidr}"

  tags = {
      Environment = "${var.environment}"
  }
}

# private subnet for web servers
resource "aws_subnet" "private_web" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${var.private_web_cidr}"

    tags = {
      Environment = "${var.environment}"
    }
}

#private subnet for database
resource "aws_subnet" "private_db" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${var.private_db_cidr}"

    tags = {
      Environment = "${var.environment}"
    }
}