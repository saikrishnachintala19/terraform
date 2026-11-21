data "aws_ami" "latest" {
  most_recent = true
  owners      = ["973714476881"] # Canonical (Ubuntu)

  filter {
    name   = "name"
    values = [var.ami_name_filter]
  }
}

# resource "aws_instance" "web" {
#   # Uses var.ami_id if provided; otherwise falls back to the data source
#   ami           = coalesce(var.ami_id, data.aws_ami.latest.id)
#   instance_type = "t3.micro"
# }
resource "aws_instance" "data-source" {
  ami= data.aws_ami.latest.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.data-source.id]
  tags = {
     Name = "roboshop-web"
    }
}

resource "aws_security_group" "data-source" {
  name        = "data-source"
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
     Name = "data-source"
    }
}