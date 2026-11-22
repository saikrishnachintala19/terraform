resource "aws_instance" "local" {
  ami                    = var.ami
  instance_type          = local.instance_type
  vpc_security_group_ids = [aws_security_group.local.id]
  tags                   = local.ec2_tags
}
resource "aws_security_group" "local" {
  name        = local.tg_Name
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port   = var.from_port
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr
  }

  egress {
    from_port   = var.from_port
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr
  }

  tags = local.ec2_tags
}