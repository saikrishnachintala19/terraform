variable "instance_type" {
  type = map
  default = {
    dev = "t3.small"
    prod= "t3.medium"
    uat= "t3.micro"
  }
}
# variable "ami" {
#   description = "The EC2 ami declaration."
#   type        = string
#   #default     = "ami-0055977a6e828a4f4"
# }

variable "tag_name" {
  type= map
  default= {
        Name= "roboshop-mongodb"
        Environment= "dev"
        Terraform= "True"
        project= "roboshop"
        component= "mongodb"
  }
}

variable "cidr" {
  description = "The EC2 cidr declaration."
  type        = list
  default     = ["0.0.0.0/0"]
}


variable "from_port" {
  description = "The EC2 port declaration."
  type        = number
  default     = 0
}