resource "aws_security_group" "dynamic" {
  #count=10
#   for_each = var.instances # terraform will give special veriable each
#   name = "${var.project}-${var.environment}-${each.key}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  dynamic "ingress" { # terraform will give us block name as special veriable
    for_each = var.dynamic
    content {
    from_port   = each.value.port
    to_port     = each.value.port
    protocol    = "tcp"
    cidr_blocks = each.value.cidr
    }
  }

  egress {
    from_port   = var.from_port
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cid
  }

  tags = {
    Name = "dynamic demo"
  }
}