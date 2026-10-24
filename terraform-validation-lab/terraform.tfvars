tags = {
  Team       = "Cloud"
  CostCenter = "TI"
}

subnets = [
  "subnet-app-a",
  "subnet-app-b"
]

application = {
  name        = "portal"
  environment = "dev"
  replicas    = 2
}