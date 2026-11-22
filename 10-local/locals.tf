locals {
  instance_type = "t3.micro"
  tg_Name       = "${var.tag_name.Name}-${var.tag_name.Environment}"
  common_tag = {
    project     = var.tag_name.project
    Environment = var.tag_name.Environment
    Terraform   = "True"
  }
  ec2_tags = merge(
    local.common_tag,
    {
      Name = local.tg_Name
    }
  )
}