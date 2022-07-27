output "flaskapp-ip" {
  value = aws_instance.flaskapp.public_ip
}

output "master-public-ip" {
  value = aws_instance.master.public_ip
}

output "master-private-ip" {
  value = aws_instance.master.private_ip
}

output "replica-public-ip" {
  value = aws_instance.replica.public_ip
}

output "replica-private-ip" {
  value = aws_instance.replica.private_ip
}
