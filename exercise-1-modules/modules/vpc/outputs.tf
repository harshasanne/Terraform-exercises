output "vpc_id" {
  value = aws_vpc.main.id
}

output "default_sg" {
  value = aws_security_group.default.id
}
