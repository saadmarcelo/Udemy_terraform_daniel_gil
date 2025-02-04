output "aws_subnet" {
  description = "Aws subnet"
  value       = aws_subnet.vpc_subnet.id
}

output "vm_ip" {
  description = "vp public IP"
  value       = aws_instance.vm.public_ip
}
