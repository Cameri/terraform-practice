output "alb_dns_name" {
  value       = aws_lb.example.dns_name
  description = "Domain name of the load balancer"
}
output "asg_name" {
  value       = aws_autoscaling_group.example.name
  description = "Name of Auto Scaling Group"
}

output "alb_security_group_id" {
  value       = aws_security_group.alb.id
  description = "ID of security group attached to the Load Balancer"
}
