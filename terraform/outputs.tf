output "app_url" {
  value = "http://${aws_instance.expense_tracker.public_ip}:5000"
}
