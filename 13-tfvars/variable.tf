variable "instance_type" {
  type = string
}
# variable "ami" {
#   description = "The EC2 ami declaration."
#   type        = string
#   #default     = "ami-0055977a6e828a4f4"
# }

variable "environment" {
  type= string
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