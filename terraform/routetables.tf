## routetables

resource "aws_route_table" "main_rt" {
  vpc_id = aws_vpc.base_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = {
    Name = "main_rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.internet_access_through_ig.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.main_rt.id
}