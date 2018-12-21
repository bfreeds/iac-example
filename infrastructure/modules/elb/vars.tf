variable "name" {
  description = "The name of the ELB"
  type = "string"
  default = "payments-elb"
}

variable "subnet" {
    description = "The public subnet to attach to the ELB."
}

variable "security_groups" {
  description = "Security group for the ELB"
  type = "list"
}

variable "server_port" {
  description = "The port for the web servers."
  type = "string"
  default = "8080"
}

variable "number_of_instances" {
  description = "The number of instances to run - configurable so it can be changed per environment."
  type = "string"
}

variable "instances" {
  description = "The IDs of the ec2 instances to load balance."
  type = "list"
}


