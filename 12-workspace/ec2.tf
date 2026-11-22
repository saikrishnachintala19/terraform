resource "aws_instance" "workspace-demo" {
  ami = "ami-0eec78ea4cbaaf5bd"
  instance_type = lookup(var.instance_type,terraform.workspace)
  vpc_security_group_ids = [aws_security_group.workspace-demo.id]
  tags = {
     Name = "roboshop-workspace-demo"
    }
}
resource "aws_security_group" "workspace-demo" {
  name        = "workspace-demo"
  description = "Allow TLS inbound traffic and all outbound traffic"

   ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   }
  
   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
     Name = "roboshop-workspace-demo"
    }
}