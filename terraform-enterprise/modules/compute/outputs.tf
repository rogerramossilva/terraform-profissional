output "instance_id" {
  description = "ID da instância EC2"
  value       = aws_instance.application.id
}

output "public_ip" {
  description = "IP público da instância EC2"
  value       = aws_instance.application.public_ip
}

output "security_group_id" {
  description = "ID do Security Group"
  value       = aws_security_group.application.id
}
