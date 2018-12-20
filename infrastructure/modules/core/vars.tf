variable "environment" {
    description = "The environment the core module is deployed into."
    type = "string"
  
}

variable "cidr" {
  description = "CIDR block for the VPC"
  default = "10.0.0.0/16"
}

variable "dns" {
    description = "A boolean to enable/disable DNS support in the VPC."
    type = "string"
    default = "true"
}
variable "dnsh" {
    description = "A boolean to enable/disable DNS hostnames in the VPC."
    type = "string"
    default = "true"
}
variable "public_cidr" {
    description = "CIDR block for the public subnet."
    type = "string"
}
variable "private_web_cidr" {
    description = "CIDR block for the private subnet of web servers."
    type = "string"
}
variable "private_db_cidr" {
    description = "CIDR block for the RDS private subnet."
    type = "string"
}