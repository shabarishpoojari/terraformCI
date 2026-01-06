terraform {
  required_version = ">=1.3.7"
  cloud {
    organization = "AzureTerraformCloudState"
    workspaces {
      name = "TerraformCI"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "stroagesampletest"
  location = "South India"
}

resource "azurerm_storage_account" "storage" {
  name                     = "shab05storage"
  account_replication_type = "RAGRS"
  account_tier             = "Standard"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
}