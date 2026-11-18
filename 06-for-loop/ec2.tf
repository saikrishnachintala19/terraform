# resource "aws_instance" "roboshop" {
#   #count=10
#   count = length(var.instances)
#   ami = "ami-0055977a6e828a4f4"
#   instance_type = var.instance_type
#   vpc_security_group_ids = [
#     aws_security_group.common.id,
#     aws_security_group.roboshop[count.index].id
#     ]
#   tags = {
#      Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
#     }
# }
# resource "aws_security_group" "common" {
#   name        = "${var.project}-${var.environment}-common"
#   description = "A common security group for all instances or roboshop"
  
#    egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     }

#     tags = {
#      Name = "${var.project}-${var.environment}-common"
#     }
# }
  resource "aws_security_group" "roboshop" {
  #count=10
  for_each = var.instances # terraform will give special veriable each
  name = "${var.project}-${var.environment}-${each.key}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port   = each.value.port_no
    to_port     = each.value.port_no
    protocol    = "tcp"
    cidr_blocks = var.cid
  }

  egress {
    from_port   = var.from_port
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cid
  }

  tags = {
    Name = "${var.project}-${var.environment}-${{each.key}}"
  }
}