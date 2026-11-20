resource "aws_route53_record" "roboshop" {
  #count = 10
  for_each= aws_instance.roboshop # Ec2 output is become input to the R53
  zone_id = var.route53
  name    = "${each.key}.saikrishna-lab.online"
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "frontend" {
  #count = 10
  count = contains(keys(var.instances),"frontend") ? 1 : 0
  zone_id = var.route53
  name    = "saikrishna-lab.online"
  type    = "A"
  ttl     = 1
  records = [lookup(aws_instance.roboshop,"frontend").public_ip]
  allow_overwrite = true
}