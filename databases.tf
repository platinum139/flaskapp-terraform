resource "aws_db_instance" "flaskapp-db" {
  identifier             = "flaskapp-db"
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "8.0.29"
  instance_class         = "db.t3.micro"
  db_name                = "student"
  username               = var.db-username
  password               = var.db-password
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.flaskapp-sg.id]
  tags = {
    "Name" = "flaskapp-db"
  }
}
