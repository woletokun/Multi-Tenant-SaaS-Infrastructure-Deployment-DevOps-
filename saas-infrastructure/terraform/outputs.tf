output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

output "frontend_ip" {
  value = aws_instance.frontend.public_ip
}

output "backend_ip" {
  value = aws_instance.backend.public_ip
}