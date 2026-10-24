variable "name_prefix" {
  description = "Prefixo usado nos nomes dos recursos"
  type        = string
}

variable "ami_id" {
  description = "ID de uma AMI Linux válida na região selecionada"
  type        = string
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC onde o Security Group será criado"
  type        = string
}

variable "subnet_id" {
  description = "ID da subnet onde a instância será criada"
  type        = string
}

variable "instance_profile" {
  description = "Nome do Instance Profile associado à EC2"
  type        = string
}
