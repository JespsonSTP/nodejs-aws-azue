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
    container_name        = "impressotestterrastoragenetwork"
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  //skip_provider_registration = true
}

resource "azurerm_resource_group" "impressotest" {
    name = "impressotest"
    location = "eastus"
}

# Create virtual network
resource "azurerm_virtual_network" "dev-impresso-vnet" {
    name                = "dev-impresso-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = "eastus"
    resource_group_name = azurerm_resource_group.impressotest.name

    subnet {
        name = "Subnet1"
        address_prefix = "10.0.1.0/24"
    }
    subnet {
        name = "Subnet2"
        address_prefix = "10.0.2.0/24"
    }

    tags = {
        environment = "dev-impressoapi-vnet"
    }
}

/* Create subnet
resource "azurerm_subnet" "tfsubnet" {
    name                 = "Subnet1"
    resource_group_name = azurerm_resource_group.impressotest.name
    virtual_network_name = azurerm_virtual_network.dev-impresso-vnet.name
    address_prefixes       = ["10.0.1.0/24"]
}
resource "azurerm_subnet" "subnet2" {
    name                 = "Subnet2"
    resource_group_name = azurerm_resource_group.impressotest.name
    virtual_network_name = azurerm_virtual_network.dev-impresso-vnet.name
    address_prefixes       = ["10.0.2.0/24"]
}
*/