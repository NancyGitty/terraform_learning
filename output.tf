output "instance_public_ips" {
  value       = aws_instance.ec2_instance.*.public_ip
  description = "The public IP addresses of the EC2 instances"
}
output "instance_private_ips" {
  value       = aws_instance.ec2_instance.*.private_ip
  description = "The private IP addresses of the EC2 instances"
}
output "instance_addresses" {
  value       = { for i, instance in aws_instance.ec2_instance : instance.tags.Name => instance.public_ip }
  description = "A map of instance names to their public IP addresses"
}