output "vpc_id" {
  value = "aws_vpc.main.id"
}

output "public_subnet_id" {
  value = "aws_subnet.public.id"
}
output "private_web_subnet_id" {
  value = "aws_subnet.private_web.id"
}
output "private_db_subnet_id" {
  value = "aws_subnet.private_db.id"
}
