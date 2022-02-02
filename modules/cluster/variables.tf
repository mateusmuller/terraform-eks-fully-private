variable "kubernetes_version" {
  type    = string
  default = "1.21"
}

variable "cluster_name" {
  type = string
}

variable "subnet_1a" {
  type = string
}

variable "subnet_1b" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "tags" {
  type = map(string)
}