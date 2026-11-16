variable "environment" {
          type= string
          default = "dev"
}
variable "cid" {
       type= list
       default = ["0.0.0.0/0"]
}

variable "from_port" {
  type = number
}

variable "ami" {
      type=string
      default = "ami-0055977a6e828a4f4"
  
}

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