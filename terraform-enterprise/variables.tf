variable "aws_region" {
  description = "Região AWS para os recursos do laboratório"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome curto do projeto"
  type        = string
  default     = "techstore"
}

variable "environment" {
  description = "Ambiente do projeto"
  type        = string
  default     = "dev"
}

variable "availability_zone" {
  description = "Zona de disponibilidade da AWS"
  type        = string
  default     = "us-east-1a"
}


variable "vpc_cidr" {
  description = "Bloco CIDR da VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR da subnet pública"
  type        = string
  default     = "10.10.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR da subnet privada"
  type        = string
  default     = "10.10.2.0/24"
}

variable "ami_id" {
  description = "ID de uma AMI Linux válida na região selecionada"
  type        = string
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t2.micro"
}
