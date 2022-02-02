data "aws_region" "region" {}

resource "aws_subnet" "subnet_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 1)
  availability_zone = format("%sa", data.aws_region.region.name)

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}

resource "aws_subnet" "subnet_1b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 2)
  availability_zone = format("%sb", data.aws_region.region.name)

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}

resource "aws_route_table_association" "route_table_association_1a" {
  subnet_id      = aws_subnet.subnet_1a.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "route_table_association_1b" {
  subnet_id      = aws_subnet.subnet_1b.id
  route_table_id = aws_route_table.route_table.id
}