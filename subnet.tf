resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.0.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-west-2a"
  tags = {
    Name = "public-subnet-1a"
  }
}
# resource "aws_subnet" "private-subnet" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "192.168.1.0/24"
#   map_public_ip_on_launch = false
#   availability_zone ="eu-west-2b"
#   tags = {
#     Name = "private-subnet-1b"
#   }
# }