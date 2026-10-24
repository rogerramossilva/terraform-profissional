output "application_name" {
  description = "Nome da aplicação"
  value       = var.application.name
}

output "environment" {
  description = "Ambiente da aplicação"
  value       = var.application.environment
}

output "replicas" {
  description = "Quantidade de réplicas"
  value       = var.application.replicas
}

output "tags" {
  description = "Tags corporativas"
  value       = var.tags
}

output "subnets" {
  description = "Lista de subnets"
  value       = var.subnets
}
