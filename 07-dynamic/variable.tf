
variable "dynamic" {
      default = {
          ssh =  {
            port= 22
            cidr= ["0.0.0.0/0"]
            description = "Open port 22 for all ip address."
          },
          mysql =  {
            port= 3306
            cidr= ["0.0.0.0/0"]
            description = "Open port 3306 for all ip address."
          },
          http =  {
            port= 80
            cidr= ["0.0.0.0/0"]
            description = "Open port 80 for all ip address."
          },
        
      }
}

# variable "instance_type" {
#   description = "The EC2 instance type to provision."
#   type        = string
#   default     = "t3.micro"
#   validation {
#     condition     = contains(["t3.micro", "t3.small", "t3.large","t3.medium"], var.instance_type)
#     error_message = "Environment must be one of above."

#   }
# }
# variable "ami" {
#   description = "The EC2 ami declaration."
#   type        = string
#   default     = "ami-0055977a6e828a4f4"
# }

# variable "tag_name" {
#   type= map
#   default= {
#         Name= "roboshop-mongodb"
#         Environment= "dev"
#         Terraform= "True"
#         project= "roboshop"
#         component= "mongodb"
#   }
# }

variable "cid" {
  description = "The EC2 cidr declaration."
  type        = list
  default     = ["0.0.0.0/0"]
}


variable "from_port" {
  description = "The EC2 port declaration."
  type        = number
  default     = 0
}

# variable "project" {
#       type = string
#       default ="roboshop"
# }

# variable "environment" {
#       type = string
#       default ="dev"
# }
# variable "zone-id" {
#       type = string
#       default ="Z0053784XSNYTS2952Q9"
# }
# variable "instances" {
#         type = map 
#         default = {
#           mongodb = {
#             instance_type= "t3.micro"
#             port_no= 27017
#           },
#           redis= {
#             instance_type= "t3.small"
#             port_no= 6379
#           },
#           mysql= {
#             instance_type= "t3.small"
#             port_no= 3306
#           },
#           rabbitmq= {
#             instance_type= "t3.small"
#             port_no= 5672
#           },
#           catalog= {
#             instance_type= "t3.small"
#             port_no= 8080
#           },
#           user= {
#             instance_type= "t3.small"
#             port_no= 8080
#           },
#           cart= {
#             instance_type= "t3.small"
#             port_no= 8080
#           },
#           shipping= {
#             instance_type= "t3.small"
#             port_no= 8080
#           },
#           payment= {
#             instance_type= "t3.small"
#             port_no= 8080
#           },
#           frontend= {
#             instance_type= "t3.small"
#             port_no= 80
#           }
#        }
# }

# variable "route53" {
#        type = string
#        default = "Z0053784XSNYTS2952Q9"
# }