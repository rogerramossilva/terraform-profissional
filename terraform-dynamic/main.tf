resource "aws_security_group" "application" {

  name = "application-sg"

  dynamic "ingress" {

    for_each = var.ingress_rules

    iterator = rule

    content {

      description = rule.value.name

      from_port = rule.value.port
      to_port   = rule.value.port

      protocol = rule.value.protocol

      cidr_blocks = rule.value.cidr_blocks
    }
  }
}
