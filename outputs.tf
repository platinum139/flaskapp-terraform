output "flaskapp-ip" {
  value = aws_instance.flaskapp.public_ip
}

output "flaskapp-db-hostname" {
  value = aws_db_instance.flaskapp-db.address
}
