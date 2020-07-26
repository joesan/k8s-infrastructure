provider "azurerm" {
  version = "=2.13.0"

  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-kubernetes-resources"
  location = "uksouth"
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name       = "${var.prefix}-kubernetes-cluster"
  location   = azurerm_resource_group.rg.location
  dns_prefix = "${var.prefix}-k8s"

  resource_group_name = azurerm_resource_group.rg.name
  kubernetes_version  = "${var.k8s-version}"

  default_node_pool {
    name       = "aks"
    node_count = "1"
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }
}
