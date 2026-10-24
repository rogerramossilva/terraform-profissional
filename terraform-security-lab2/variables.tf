############################################
# VARIÁVEIS GERAIS
############################################

variable "environment" {
  description = "Ambiente da infraestrutura AWS"
  type        = string

  validation {
    condition     = contains(["dev", "homolog", "prod"], var.environment)
    error_message = "O ambiente deve ser dev, homolog ou prod."
  }
}

############################################
# BUCKET PRINCIPAL DE DADOS
############################################

variable "bucket_name" {
  description = "Nome globalmente único do bucket S3 de dados"
  type        = string
}

############################################
# BUCKET DE LOGS
############################################

variable "log_bucket_name" {
  description = "Nome globalmente único do bucket S3 de logs"
  type        = string
}

############################################
# ROLE IAM PARA REPLICAÇÃO
############################################

variable "replication_role_arn" {
  description = "ARN da role IAM utilizada na replicação dos buckets S3"
  type        = string
}

############################################
# BUCKET DE DESTINO DA REPLICAÇÃO
############################################

variable "destination_bucket_arn" {
  description = "ARN do bucket S3 de destino da replicação"
  type        = string
}
