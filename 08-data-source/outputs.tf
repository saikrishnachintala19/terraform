output "selected_ami_id" {
  #value = data.aws_ami.latest.id
  value = data.aws_ami.latest
}

# output "selected_ami_name" {
#   #value = data.aws_ami.latest.name
# }

output "instance_id" {
  #value = aws_instance.data-source.id
  value = aws_instance.data-source
}

# output "instance_public_ip" {
#   value = aws_instance.data-source.public_ip
# }

output "security_group_id" {
  #value = aws_security_group.data-source.id
  value = aws_security_group.data-source
}

# output "security_group_name" {
#   value = aws_security_group.data-source.name
# }