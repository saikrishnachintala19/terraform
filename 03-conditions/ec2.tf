resource "aws_instance" "conditions" {
  ami = var.ami
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.medium"
  vpc_security_group_ids = [aws_security_group.conditions.id]
  tags = var.tag_name
}
resource "aws_security_group" "conditions" {
  name        = "conditions"
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

  tags = {
    Name = "roboshop-conditions"
  }
}
#terraform state show aws_security_group.conditions