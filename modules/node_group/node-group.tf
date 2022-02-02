resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = format("%s-node-group", var.cluster_name)
  node_role_arn   = aws_iam_role.eks_node_role.arn

  subnet_ids = [
    var.subnet_1a,
    var.subnet_1b
  ]

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  remote_access {
    ec2_ssh_key = "eks"
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks_AmazonEC2ContainerRegistryReadOnly
  ]
}