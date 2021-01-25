variable "env" {
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