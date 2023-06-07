resource "azurerm_virtual_network" "vnet" {
  name      = format("%s-vnet",var.name)
  location  = var.location
  resource_group_name = var.name
  address_space       = var.vnet_cidr
}