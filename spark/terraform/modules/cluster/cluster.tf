resource "azurerm_resource_group" "aks-spark" {
  name     = "aks-spark"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks-spark" {
  name                             = "aks-spark"
  location                         = azurerm_resource_group.aks-spark.location
  resource_group_name              = azurerm_resource_group.aks-spark.name
  dns_prefix                       = "aks-spark"
  kubernetes_version               = var.kubernetes_version
  azure_policy_enabled             = false
  http_application_routing_enabled = false
  default_node_pool {
    name            = "default"
    node_count      = 1
    vm_size         = "Standard_DS2_v2"
    type            = "VirtualMachineScaleSets"
    os_disk_size_gb = 250
  }

  service_principal {
    client_id     = var.serviceprinciple_id
    client_secret = var.serviceprinciple_key
  }

  linux_profile {
    admin_username = "azureuser"
    ssh_key {
      key_data = var.ssh_key
    }
  }


}


