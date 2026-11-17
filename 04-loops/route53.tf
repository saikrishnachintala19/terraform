resource "aws_route53_record" "roboshop" {
  count = 10
  zone_id = var.route53
  name    = "${var.instances[count.index]}.saikrishna-lab.online"
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop[count.index].private_ip]
}