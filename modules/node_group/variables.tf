variable "desired_size" {
  type = number
  default = 1
}

variable "max_size" {
  type = number
  default = 1
}

variable "min_size" {
  type = number
  default = 0
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