module "network" {
  source = "./modules/network"

  cluster_name = var.cluster_name
  tags         = var.tags
  cidr_block   = var.cidr_block
}

module "cluster" {
  source = "./modules/cluster"

  cluster_name = var.cluster_name
  tags         = var.tags
  cidr_block   = var.cidr_block

  subnet_1a = module.network.subnet_1a
  subnet_1b = module.network.subnet_1b
}

module "node_group" {
  source = "./modules/node_group"

  cluster_name = var.cluster_name
  tags         = var.tags

  subnet_1a = module.network.subnet_1a
  subnet_1b = module.network.subnet_1b

  depends_on = [
    module.cluster
  ]
}