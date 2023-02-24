

resource "aws_security_group" "allow_sg" {
  name        = "HTTP and SSH"
  description = "Allow HTTP and SSH access"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_web"
  }
}

resource "aws_instance" "sg_instance" {
  ami               = var.ami-id
  instance_type     = var.instance-type
  availability_zone = "us-west-2a"
  security_groups   = [aws_security_group.allow_sg.name]
  tags = {
    Name = "web"
  }
}