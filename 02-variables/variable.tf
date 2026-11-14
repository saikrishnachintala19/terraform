variable "instance_type" {
  description = "The EC2 instance type to provision."
  type        = string
  default     = "t3.micro"
  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.large","t3.medium"], var.instance_type)
    error_message = "Environment must be one of above."

  }
}
variable "ami" {
  description = "The EC2 ami declaration."
  type        = string
  #default     = "ami-0055977a6e828a4f4"
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