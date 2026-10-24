resource "aws_vpc" "lab" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "lab-operacoes"
  }
}


resource "aws_subnet" "public" {
  vpc_id = aws_vpc.lab.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.aws_region}a"
  tags = {
    Name = "lab-public-subnet"
  }
}

resource "aws_security_group" "web" {
  name = "lab-sg"
  description = "Security Group do Laboratorio"
  vpc_id = aws_vpc.lab.id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami = "ami-097855b862d5b1eb2"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = [
    aws_security_group.web.id
  ]
  tags = {
    Name = "Servidor-Producao"
  }
}

resource "aws_eip" "web" {
  instance = aws_instance.web.id
  domain = "vpc"
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.lab.id
  tags = {
    Name = "lab-internet-gateway"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.lab.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "lab-public-route-table"
  }

}

resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}