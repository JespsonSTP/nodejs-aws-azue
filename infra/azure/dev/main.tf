/*
resource "azurerm_storage_account" "lab" {
  name                     = "[Insert unique storage account name here]"
  resource_group_name      = "[Insert your Resource Group's name here]"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Terraform Storage"
    CreatedBy   = "Admin"
  }
}
to deploy a virtual network we need a resource group
*/