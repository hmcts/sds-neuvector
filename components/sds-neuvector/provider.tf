terraform {
  required_version = "~> 1.6.0"
  backend "azurerm" {
    subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.117.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.40.0"
    }
  }
}

provider "azurerm" {
  features {}
}
