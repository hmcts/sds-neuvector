terraform {
  required_version = ">= 0.14.4"
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.44.0"
    }
  }
}

provider "azurerm" {
  features {}
}