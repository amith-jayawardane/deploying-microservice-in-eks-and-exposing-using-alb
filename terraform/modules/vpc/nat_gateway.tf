resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.nat_subnet_1.id

  tags = {
    Name = "nat_gateway"
  }

  depends_on = [aws_internet_gateway.internet_gateway]
}