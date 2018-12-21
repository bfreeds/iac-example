output "id" {
    description = "The IDs of the instances."
    value = "${module.ec2_cluster.id}"
}