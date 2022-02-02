resource "aws_security_group" "sg_vpc_endpoint" {
  name   = "Allow port 443 from VPC CIDR"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description = "HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.cidr_block]
  }

  tags = var.tags
}

resource "aws_vpc_endpoint" "vpce_ecr_api" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${data.aws_region.region.name}.ecr.api"
  vpc_endpoint_type = "Interface"

  security_group_ids = [aws_security_group.sg_vpc_endpoint.id]

  subnet_ids = [
    aws_subnet.subnet_1a.id,
    aws_subnet.subnet_1b.id
  ]

  private_dns_enabled = true

  tags = var.tags
}

resource "aws_vpc_endpoint" "vpce_ecr_dkr" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${data.aws_region.region.name}.ecr.dkr"
  vpc_endpoint_type = "Interface"

  security_group_ids = [aws_security_group.sg_vpc_endpoint.id]

  subnet_ids = [
    aws_subnet.subnet_1a.id,
    aws_subnet.subnet_1b.id
  ]

  private_dns_enabled = true

  tags = var.tags
}

resource "aws_vpc_endpoint" "vpce_ec2" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${data.aws_region.region.name}.ec2"
  vpc_endpoint_type = "Interface"

  security_group_ids = [aws_security_group.sg_vpc_endpoint.id]

  subnet_ids = [
    aws_subnet.subnet_1a.id,
    aws_subnet.subnet_1b.id
  ]

  private_dns_enabled = true

  tags = var.tags
}

resource "aws_vpc_endpoint" "vpce_sts" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${data.aws_region.region.name}.sts"
  vpc_endpoint_type = "Interface"

  security_group_ids = [aws_security_group.sg_vpc_endpoint.id]

  subnet_ids = [
    aws_subnet.subnet_1a.id,
    aws_subnet.subnet_1b.id
  ]

  private_dns_enabled = true

  tags = var.tags
}

resource "aws_vpc_endpoint" "vpce_logs" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${data.aws_region.region.name}.logs"
  vpc_endpoint_type = "Interface"

  security_group_ids = [aws_security_group.sg_vpc_endpoint.id]

  subnet_ids = [
    aws_subnet.subnet_1a.id,
    aws_subnet.subnet_1b.id
  ]

  private_dns_enabled = true

  tags = var.tags
}

resource "aws_vpc_endpoint" "vpce_s3" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${data.aws_region.region.name}.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [
    aws_route_table.route_table.id
  ]

  tags = var.tags
}