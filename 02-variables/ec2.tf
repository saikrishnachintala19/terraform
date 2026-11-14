resource "aws_instance" "webapp" {
  ami = "ami-0eec78ea4cbaaf5bd"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.web.id]
  tags = {
     Name = "roboshop-webap"
    }
}
resource "aws_security_group" "webapp" {
  name        = "webap"
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
     Name = "roboshop-webaps"
    }
}