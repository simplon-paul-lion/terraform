module "main" {
  source   = "./Module/network/main"
  name     = var.name
  location = var.location
}

module "vnet" {
  source                = "./Module/network/vnet"
  name                  = format("%s",var.name)
  location              = var.location
  vnet_cidr             = var.vnet_cidr

}

module "subnet" {
  count = var.desc_infra["is_subnet"]?1:0
  source= "./Module/network/subnet"
  subnet =var.subnet
  name = var.name
  location = var.location 
}
 
module "aks" {
  count = var.desc_infra["is_aks"]?1:0
  source = "./Module/aks"
  name = format("%s",var.name)
  location = var.location
  aks_node_pool_config = var.aks_node_pool_config
}