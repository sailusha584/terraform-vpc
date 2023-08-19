resource "aws_security_group" "web" {
  name        = "wordpress-SG"
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      = aws_vpc.main.id


  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "wordpress-SG"
  }
}
# resource "aws_security_group" "db" {
#   name        = "mysql-SG"
#   description = "Allow webserver-SG inbound traffic"
#   vpc_id      = aws_vpc.main.id


#   ingress {
#     description = "MYSQL"
#     security_groups = [aws_security_group.web.id]
#     from_port   = 3306
#     to_port     = 3306
#     protocol    = "tcp"
 
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }


#   tags = {
#     Name = "mysql-SG"
#   }
# }
