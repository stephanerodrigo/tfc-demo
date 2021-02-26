output "subnet_id" {
  description = "List of IDs of VPC subnets of instances"
  value       = aws_instance.bayer_instance.*.subnet_id
}

output "EC2_count" {
  description = "Number of instances to launch specified as argument to this module"
  value       = var.EC2_count
}

output "id" {
  description = "List of IDs of instances"
  value       = aws_instance.bayer_instance.*.id
}
