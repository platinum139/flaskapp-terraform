resource "aws_key_pair" "aws_key" {
  key_name   = "devops_school_key"
  public_key = file("~/.ssh/devops_school_key_rsa.pub")
}

resource "aws_instance" "flaskapp" {
  ami           = var.ubuntu-ami
  instance_type = "t2.micro"

  key_name = aws_key_pair.aws_key.key_name

  vpc_security_group_ids = [
    aws_security_group.flaskapp-sg.id
  ]

  tags = {
    Name = "flaskapp"
  }
}

resource "aws_instance" "master" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  key_name = aws_key_pair.aws_key.key_name

  vpc_security_group_ids = [
    aws_security_group.db-servers-sg.id
  ]

  tags = {
    Name = "master"
  }
}

resource "aws_instance" "replica" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  key_name = aws_key_pair.aws_key.key_name

  vpc_security_group_ids = [
    aws_security_group.db-servers-sg.id
  ]

  tags = {
    Name = "replica"
  }
}
