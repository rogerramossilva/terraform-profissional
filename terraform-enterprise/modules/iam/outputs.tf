output "application_role_name" {
  description = "Nome da IAM Role da aplicação"
  value       = aws_iam_role.application.name
}

output "instance_profile_name" {
  description = "Nome do Instance Profile para EC2"
  value       = aws_iam_instance_profile.application.name
}
