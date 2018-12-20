variable "environment" {
    description = "The environment the core module is deployed into."
    type = "string"
  
}

variable "cidr" {
  description = "CIDR block for the VPC"
  default = "10.0.0.0/16"
}

variable "azs" {
    description = "List of Availability Zones"
    type = "list"
}

variable "private_subnets" {
    description = "List of CIDR blocks for the private subnets"
    type = "list"
}
variable "public_subnets" {
    description = "List of CIDR blocks for the public subnets."
    type = "list"
}
variable "database_subnet" {
    description = "List CIDR blocks for the RDS private subnet."
    type = "list"
}