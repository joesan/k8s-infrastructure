provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.prefix
  location = var.location
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name       = var.prefix
  location   = azurerm_resource_group.rg.location
  dns_prefix = var.prefix

  resource_group_name = azurerm_resource_group.rg.name
  kubernetes_version  = "var.k8s_version"

  default_node_pool {
    name       = "${var.prefix}_aks"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  identity {
    type = "SystemAssigned"
  }
}
