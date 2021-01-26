variable "environment" {
  description = "Name of the environment to deploy infrastructure"
  type        = string
}

variable "product" {
  description = "Name of the product"
  type        = string
}

variable "location" {
  description = "Azure location used for resource deployment"
  type        = string
}

variable "key_vault" {
  description = "Name of the key vault used by neuvector"
  type = object({
    name                = string
    resource_group_name = string
  })
}

variable "project" {}