variable "ingress_rules" {

  description = "Regras de entrada do Security Group"

  type = list(object({
    name        = string
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))

}
