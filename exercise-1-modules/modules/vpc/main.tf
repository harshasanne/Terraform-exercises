resource "aws_vpc" "main" {
  cidr_block = var.cidr

  tags = {
    Name = "MainVPC"
  }
}

resource "aws_security_group" "default" {
  name        = "default_sg"
  description = "Default security group"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "default_sg"
  }
}
