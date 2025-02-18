output "aws_subnet" {
  description = "Aws subnet"
  value       = aws_subnet.vpc_subnet.id
}

output "eip" {
  description = "Elastic IP"
  value       = aws_eip.iep.public_ip
}
