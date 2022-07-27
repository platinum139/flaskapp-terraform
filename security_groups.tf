data "aws_vpc" "default_vpc_data" {
  default = true
}

# database servers security group
resource "aws_security_group" "db-servers-sg" {
  name   = "db-servers-sg"
  vpc_id = data.aws_vpc.default_vpc_data.id

  tags = {
    Name = "db-servers-sg"
  }
}

resource "aws_security_group_rule" "db_allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.db-servers-sg.id
}

resource "aws_security_group_rule" "db_allow_mysql" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.default_vpc_data.cidr_block]
  security_group_id = aws_security_group.db-servers-sg.id
}

resource "aws_security_group_rule" "db_allow_all_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.db-servers-sg.id
}

# application server security group
resource "aws_security_group" "flaskapp-sg" {
  name   = "flaskapp-sg"
  vpc_id = data.aws_vpc.default_vpc_data.id

  tags = {
    Name = "flaskapp-sg"
  }
}

resource "aws_security_group_rule" "app_allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.flaskapp-sg.id
}

resource "aws_security_group_rule" "app_allow_8000" {
  type              = "ingress"
  from_port         = 8000
  to_port           = 8000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.flaskapp-sg.id
}

resource "aws_security_group_rule" "app_allow_all_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.flaskapp-sg.id
}
