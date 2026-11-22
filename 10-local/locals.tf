locals {
  instance_type= "t3.micro"
  tg_Name= ${var.tag_name.Name}-$(var.tag_name.Environment)
  name= tg_Name

}