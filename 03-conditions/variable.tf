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