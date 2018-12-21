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
variable "private_subnet" {
    description = "List of CIDR blocks for the private subnets"
    type = "list"
}
variable "public_subnet" {
    description = "List of CIDR blocks for the public subnets."
    type = "list"
}
variable "database_subnet" {
    description = "List CIDR blocks for the RDS private subnet."
    type = "list"
}
variable "server_port" {
    description = "The port the web servers will communicate on."
    type = "string"
}
variable "DB_PORT" {
    description = "The port for RDS"
    type = "string"
}

### THESE WOULD BE PASSED TO ROUTE53 TO ATTACH 
### THE ELB TO THE DNS RECORD (PAYMENTS.THEMARKUP.ORG)
### HOWEVER, SINCE I DO NOT HAVE THE DNS REGISTERED
### I'M COMMENTING OUT TO BE ABLE TO ITERATIVELY TEST

# variable "elb_dns_name" {
#     description = "Elastic Load Balancer DNS"
#     type = "string"
# }
# variable "elb_zone_id" {
#     description = "Elastic Load Balancer zone"
#     type = "string"
# }