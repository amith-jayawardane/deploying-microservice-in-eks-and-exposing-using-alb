resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.frontend_vpc.id

  tags = {
    Name = "main_internet_gateway"
  }
}