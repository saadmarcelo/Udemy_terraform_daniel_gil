output "vm_ip" {
  description = "IP da VM craida na AWS"
  value       = aws_instance.vm.public_ip

}
