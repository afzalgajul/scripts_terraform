resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main_vpc"
  }
}

# Declare the resource for the public subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "public_subnet"
  }
}

# Declare the resource for the security group
resource "aws_security_group" "web_sg" {
  name        = "HTTP and SSH"
  description = var.description
  vpc_id      = aws_vpc.main.id

  ingress {
    description = " HTTP access from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http"
  }
}

resource "aws_instance" "public" {
  ami           = "ami-0f1a5f5ada0e7da53"

  instance_type = "t2.micro"
  subnet_id = aws_subnet.public.id

  tags = {
    Name = "public_subnet"
  }
}
