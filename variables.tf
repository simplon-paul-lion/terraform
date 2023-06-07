variable "desc_infra" {
  description = "define which kind of resources to deploy (true = deploy)"
  type        = map(bool)
  default = {
    is_subnet = false
    is_aks    = true
  }

}

variable "name" {
  description = "define the start of naming resources"
  type        = string
  default     = "paul-bf10"
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "vnet_cidr" {
  default = ["10.0.0.0/16"]
  
}

variable "subnet" {
  type = map
  default = {
    sub1 : ["10.0.1.0/24"]
    sub2 : ["10.0.2.0/24"]  
  }
  
}