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
    container_name        = "impressotestterrastoragecontainerinstance"
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  //skip_provider_registration = true
}
//import resource group to terraform
//terraform import azurerm_resource_group.example /subscriptions/YOUR_SUBSCRIPTION_ID/resourceGroups/YOUR_RESOURCE_GROUP_NAME
//resource group
resource "azurerm_resource_group" "impressotest" {
    name = "impressotest"
    location = "eastus"
}

resource "azurerm_log_analytics_workspace" "dev-impressoapi-law" {
    name = "dev-impressoapi-law"
    resource_group_name = azurerm_resource_group.impressotest.name
    location = azurerm_resource_group.impressotest.location
}

resource "azapi_resource" "acr" {
  type = "Microsoft.ContainerRegistry/registries@2021-09-01"
  name = "devimpressoapiacr"
  location = azurerm_resource_group.impressotest.location
  parent_id = azurerm_resource_group.impressotest.id
  body = jsonencode({
    sku = {
      name = "Standard"
    }
    properties = {
      adminUserEnabled = false
    }
  })
}


resource "azapi_resource" "aca_env" {
  type      = "Microsoft.App/managedEnvironments@2022-03-01"
  parent_id = azurerm_resource_group.impressotest.id
  location  = azurerm_resource_group.impressotest.location
  name      = "aca-env-terraform"
  body   = jsonencode({
    properties = {
      appLogsConfiguration = {
        destination               = "log-analytics"
        logAnalyticsConfiguration = {
          customerId = azurerm_log_analytics_workspace.dev-impressoapi-law.workspace_id
          sharedKey  = azurerm_log_analytics_workspace.dev-impressoapi-law.primary_shared_key
        }
      }
    }
 })
}


//now the container app with our container configuration
resource "azapi_resource" "aca" {
  type      = "Microsoft.App/containerApps@2022-03-01"
  parent_id = azurerm_resource_group.impressotest.id
  location  = azurerm_resource_group.impressotest.location
  name      = "dev-impressapi"

  body = jsonencode({
    properties : {
        managedEnvironmentId = azapi_resource.aca_env.id
        configuration = {
            ingress = {
                external = true
                targetPort = 80
            }
        }
        template = {
            containers = [
                {
                    name = "web"
                    image= "nginx"
                    resources = {
                        cpu = 0.5
                        memory = "1.0Gi"
                    }
                }
            ]
            scale = {
                minReplicas = 2
                maxReplicas = 2
            }
        }
    }
  })
}