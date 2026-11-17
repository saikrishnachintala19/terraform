resource "aws_route53_record" "roboshop" {
  #count = 10
  count = length(var.instances)
  zone_id = var.route53
  name    = "${var.instances[count.index]}.saikrishna-lab.online"
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop[count.index].private_ip]
}

resource "aws_route53_record" "frontend" {
  #count = 10
  count = contains(var.instances,frontend) ? 1 : 0
  zone_id = var.route53
  name    = "saikrishna-lab.online"
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop[index(var.instances,frontend)].public_ip]
}