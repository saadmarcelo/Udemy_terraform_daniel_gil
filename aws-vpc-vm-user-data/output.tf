output "vpc_subnet" {
  description = "vpc subnet id"
  value       = aws_subnet.subnet.id
}

output "security_group_id" {
  description = "ID da security group"
  value       = aws_security_group.allow_tls.id
}

output "vm_ip" {
  description = "VM public ip"
  value       = aws_instance.vm.public_ip

}
