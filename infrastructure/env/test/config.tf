# AWS Provider Config
variable "aws_profile" {
    description = "The AWS user profile to use (stored at ~/.aws/credentials)"
    type = "string"
}

# TODO: Implement cross-AZ fault tolerance
# variable "azs" {
#     description = "The Availability Zones for the test infrastructure"
#     type = "list"
#     default = ["us-east-1a", "us-east-1b"]
# }