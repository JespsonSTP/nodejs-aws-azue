terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.85.0"
    }
    azapi = {
      source = "Azure/azapi"
      version = "1.10.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = "impressotest"        
    storage_account_name  = "impressotestterrastorage"
    container_name        = "impressotestterrastorage"
    key                   = "terraform.tfstate"
  }
}
