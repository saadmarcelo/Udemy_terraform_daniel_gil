output "eip" {
  description = "VM Elastic IP"
  value       = aws_eip.eip.public_ip
}
