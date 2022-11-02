terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.29.1"
    }
  }
}


module "cluster" {
  source               = "./modules/cluster/"
  serviceprinciple_id  = var.serviceprinciple_id
  serviceprinciple_key = var.serviceprinciple_key
  ssh_key              = var.ssh_key
  location             = var.location
  kubernetes_version   = var.kubernetes_version
}