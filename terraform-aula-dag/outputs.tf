output "vpc_id" {
  value = aws_vpc.lab.id
}

output "subnet_id" {
  value = aws_subnet.lab.id
}

output "instance_id" {
  value = aws_instance.lab.id
}
