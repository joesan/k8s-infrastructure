variable "subscription_id" {
  default = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

variable "tenant_id" {
  default = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

variable "ssh_key" {
    description = "Specify public SSH key for AKS cluster." 
}

variable "prefix" {
  type = string
  description = "A prefix used for all resources in this example"
  default = "joesan"
}

variable "client_id" {
  description = "The Client ID (appId) for the Service Principal used for the AKS deployment"
}

variable "client_secret" {
  description = "The Client Secret (password) for the Service Principal used for the AKS deployment"
}

variable "location" {
  type = string
  description = "The Azure Region in which all resources in this example should be provisioned"
  default = "westeurope"
}

variable "k8s_version" {
  description = "The version of the Kubernetes to be used"
  default = "1.2.3"
}

variable "vm_size" {
  description = "The size of the vm for our default pool"
  default = "Standard_D2s_v3"
}

variable "node_count" {
  description = "The count of the vm nodes for our default pool"
  default = 2
}
