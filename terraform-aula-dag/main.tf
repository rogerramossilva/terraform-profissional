provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "lab" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "vpc-lab"
  }
}

resource "aws_subnet" "lab" {
  vpc_id     = aws_vpc.lab.id
  cidr_block = "10.10.1.0/24"

  tags = {
    Name = "subnet-lab"
  }
}

resource "aws_security_group" "lab" {
  name   = "sg_lab"
  vpc_id = aws_vpc.lab.id

  tags = {
    Name = "sg-lab"
  }
}

resource "aws_instance" "lab" {
  ami           = var.ami_id
  instance_type = "t3.micro"

  subnet_id = aws_subnet.lab.id

  vpc_security_group_ids = [
    aws_security_group.lab.id
  ]

  tags = {
    Name = "ec2-lab"
  }
}