variable "name" {
  type = "string"
}

variable "location" {
  type = "string"
}

variable "resource_group" {
  type        = "string"
  description = "Name of Resource Group to assoicate with"
}

variable "dns_prefix" {
  type = "string"
}

variable "aks_config" {
  type        = "map"
  description = "Map of AKS Configuration options"
}

variable "vnet_subnet_id" {
  type = "string"
}

variable "client_id" {
  type = "string"
}

variable "client_secret" {
  type = "string"
}

variable "tags" {
  type = "map"
}
