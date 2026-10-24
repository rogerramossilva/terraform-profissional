variable "tags" {
  description = "Tags corporativas"
  type        = map(string)
}


variable "subnets" {
  description = "Lista de subnets"
  type        = list(string)
}



variable "application" {
  description = "Configuração da aplicação"

  type = object({
    name        = string
    environment = string
    replicas    = number
  })

  validation {
    condition = contains(
      ["dev", "hml", "prod"],
      var.application.environment
    )

    error_message = "Ambiente inválido. Utilize apenas: dev, hml ou prod."
  }

  validation {
    condition = var.application.replicas >= 1

    error_message = "Replicas devem ser maiores ou iguais a 1."
  }
}
