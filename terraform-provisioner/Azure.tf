#Azure
terraform {
  required_version = ">=1.3.0"
  required_providers {
    azurerm = {
      "source" = "hashicorp/azurerm"
      version  = "3.43.0"
    }
  }
  cloud {
    organization = "ibmwtx"

    workspaces {
      name = "TerraformCI"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

variable "ARM_SUBSCRIPTION_ID" {
  type = string
  description = "Azure subscription ID"
}

variable "ARM_CLIENT_ID" {
  type = string
  description = "Azure Client ID"
}

resource "random_string" "uniquestring" {
  length           = 20
  special          = false
  upper            = false
}

resource "azurerm_resource_group" "rg" {
  name     = "811-ba4c9e06-provide-continuous-delivery-with-gith"
  location = "eastus"
}

resource "azurerm_storage_account" "storageaccount" {
  name                     = "stg${random_string.uniquestring.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
