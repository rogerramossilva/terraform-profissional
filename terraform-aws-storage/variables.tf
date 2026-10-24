variable "bucket_name" {
  description = "Nome do bucket"
  type        = string
}

variable "region" {
  description = "Região AWS"
  type        = string
  default     = "us-east-1"
}
