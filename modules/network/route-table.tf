resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id
}