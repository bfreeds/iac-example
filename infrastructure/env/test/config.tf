# AWS Provider Config
variable "aws_profile" {
    description = "The AWS user profile to use (stored at ~/.aws/credentials)"
    type = "string"
}

# Web Server Variables
variable "server_port" {
  description = "The port the web servers listen on."
  type = "string"
  default = "8080"
}
variable "num_servers" {
  description = "The number of web servers to run."
  type = "string"
  default = "2"
}


# RDS Variables
variable "DB_USER" {
    description = "Username to be used for RDS."
}
variable "DB_PASSWORD" {
    description = "Password to be used for RDS."
}

variable "DB_PORT" {
  description = "The MySQL port."
  type = "string"
  default = "3306"
}