variable "name_prefix" {
  description = "Prefixo usado nos nomes dos recursos"
  type        = string
}

variable "bucket_arn" {
  description = "ARN do bucket que a aplicação pode consultar"
  type        = string
}
