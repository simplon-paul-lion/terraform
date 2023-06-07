resource "azurerm_subnet" "subnet" {
    for_each = var.subnet
    name                 = each.key
    resource_group_name  = var.name
    virtual_network_name = format("%s-vnet",var.name)
    address_prefixes     = each.value
  
}