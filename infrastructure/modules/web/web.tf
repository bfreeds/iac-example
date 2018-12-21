# EC2 Instance for Web
module "ec2_cluster" {
    source = "terraform-aws-modules/ec2-instance/aws"

    name = "web-${var.environment}"

    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    instance_count = "${var.quantity}"

    vpc_security_group_ids = "${var.security_groups}"
    subnet_id = "${var.subnet_id}"

}
