variable "name_prefix" {
  description = "Prefixo utilizado nos nomes dos recursos"
  type        = string
}

variable "vpc_cidr" {
  description = "Bloco CIDR da VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Bloco CIDR da subnet pública"
  type        = string
}

variable "private_subnet_cidr" {
  description = "Bloco CIDR da subnet privada"
  type        = string
}

variable "availability_zone" {
  description = "Zona de disponibilidade da AWS"
  type        = string
}
