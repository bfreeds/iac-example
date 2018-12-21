variable "environment" {
  description = "Environment of the instance."
  type = "string"
}

variable "ami" {
  description = "Amazon Machine Image to use."
  type = "string"
}

variable "instance_type" {
  description = "Type of EC2 instance to use."
  type = "string"
}

variable "quantity" {
  description = "The number of instances to run."
  type = "string"
  default = "2"
}


variable "security_groups" {
  description = "Security groups for instance."
  type = "list"
}

variable "subnet_id" {
  description = "Subnet ID for the web cluster."
  type = "string"
}


