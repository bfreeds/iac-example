module "elb_http" {
    source = "terraform-aws-modules/elb/aws"

    name = "${var.name}"
    subnets = "${var.subnet}"
    security_groups = ["${var.security_groups}"]
    internal = false # public elb

    # ELB Attachment configuration
    number_of_instances = "${var.number_of_instances}"
    instances = "${var.instances}"

    listener = [{
        instance_port = "${var.server_port}" # forward to web servers
        instance_protocol = "http"
        lb_port = "80" # receive on port 80
        lb_protocol = "HTTP"
    }]

    health_check = [
        {
            target = "HTTP:80/"
            interval = 30
            healthy_threshold = 2
            unhealthy_threshold = 2
            timeout = 5
        }
    ]


}