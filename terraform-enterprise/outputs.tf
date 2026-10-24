output "vpc_id" {
  description = "ID da VPC criada"
  value       = module.networking.vpc_id
}

output "public_subnet_id" {
  description = "ID da subnet pública"
  value       = module.networking.public_subnet_id
}

output "private_subnet_id" {
  description = "ID da subnet privada"
  value       = module.networking.private_subnet_id
}

output "storage_bucket_name" {
  description = "Nome do bucket S3 criado pelo projeto"
  value       = module.storage.bucket_name
}


output "instance_id" {
  description = "ID da instância EC2"
  value       = module.compute.instance_id
}

output "instance_public_ip" {
  description = "IP público da instância EC2"
  value       = module.compute.public_ip
}
