variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "tags" {
  type        = map(string)
  description = "Optional tags to add to some resources"
}

variable "cidr_block" {
  type        = string
  description = "The CIDR block of the VPC"
}