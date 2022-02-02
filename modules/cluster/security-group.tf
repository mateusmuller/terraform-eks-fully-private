resource "aws_security_group_rule" "eks_sg_ingress_rule" {
  cidr_blocks = ["10.0.0.0/16"]
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"

  security_group_id = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
  type              = "ingress"
}