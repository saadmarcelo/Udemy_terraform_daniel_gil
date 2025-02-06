output "eip" {
  description = "VM Elastic IP"
  value       = aws_eip.iep.public_ip
}
