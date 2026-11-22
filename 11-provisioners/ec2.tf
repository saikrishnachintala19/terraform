resource "aws_instance" "provisioners" {
  ami = "ami-0055977a6e828a4f4"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.provisioners.id]
  provisioner "local-exec" {
  command     = "echo The server IP is ${self.private_ip} > inventory.ini"
  }
  provisioner "local-exec" {
  command     = "echo The server IP is ${self.public_ip} > inventory.ini"
  }
  provisioner "local-exec" {
  command     = "echo The server IP created"
  }
  provisioner "local-exec" {
   when = destroy
   command     = "echo The server IP going to be destory"
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    password = "DevOps321"
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y nginx",
      "sudo systemctl start nginx",
    ]
  }

  tags = {
     Name = "roboshop-provisioners"
    }
}
resource "aws_security_group" "provisioners" {
  name        = "provisioners"
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
     Name = "roboshop-provisioners"
    }
}