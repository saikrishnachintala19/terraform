output "output_instances_info" {
  description = "output of all the data"
  value       = aws_instance.roboshop[count.index].private_ip
}