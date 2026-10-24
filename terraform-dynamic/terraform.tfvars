ingress_rules = [

  {
    name        = "HTTP"
    port        = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },

  {
    name        = "HTTPS"
    port        = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },

  {
    name        = "SSH"
    port        = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  },

  {
    name        = "API"
    port        = 8080
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

]
