output "output_instances_info" {
  description = "output of all the data"
  value       = aws_instance.roboshop[0].private_ip
}