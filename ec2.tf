# resource "aws_instance" "mysql" {
#  ami = "ami-0eb260c4d5475b901"
#  instance_type = "t2.micro"
#  associate_public_ip_address = false
#  subnet_id = aws_subnet.private-subnet.id
#  vpc_security_group_ids = [aws_security_group.db.id]
#  tags ={
#     Name = "mysql"
#   }
#  }
variable "PUBLIC_KEY_PATH" {
    default = "./id_rsa.pub" # Replace this with a path to your public key
}
resource "aws_instance" "wordpress" {
 ami = "ami-007ec828a062d87a5"
 instance_type = "t2.micro"
 associate_public_ip_address = true
 subnet_id = aws_subnet.public-subnet.id
 vpc_security_group_ids = [aws_security_group.web.id]
 key_name = "${aws_key_pair.key-pair.id}"


 tags ={
   Name = "wordpress"
  }

 }
resource "aws_key_pair" "key-pair" {
    key_name = "id_rsa"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}
