variable "aks_node_pool_config" {
  default = {
    default = {
      name       = "default"
      node_count = 1
      vm_size    = "Standard_D2_v2"
    }
  }
}