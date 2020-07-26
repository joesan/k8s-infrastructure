variable "prefix" {
  description = "A prefix used for all resources in this example"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be provisioned"
}

variable "k8s-version" {
  description = "The version of the Kubernetes to be used"
}

variable "default-vm-size" {
  description = "The size of the vm for our default pool"
}

variable "default-node-count" {
  description = "The count of the vm nodes for our default pool"
}
