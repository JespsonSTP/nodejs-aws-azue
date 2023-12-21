#create public ip address block in order to create load balancer
resource "azurerm_public_ip" "dev-impressoapi-pubip" {
  name = "dev-impresso-pubip"
  location = azurerm_resource_group.impressotest.location
  resource_group_name = azurerm_resource_group.impressotest.name
  allocation_method = "Static"
  domain_name_label = azurerm_resource_group.impressotest.name

  tags = {
    Environment = "dev"
  }
}

resource "azurerm_lb" "lb" {
    name = "azure-lb"
    location = azurerm_resource_group.impressotest.name
    resource_group_name = azurerm_resource_group.impressotest.name

    frontend_ip_configuration {
      name = "mypublicappname"
      public_ip_address_id = azurerm_public_ip.dev-impressoapi-pubip.id
    }

    tags = {
        Environment = "dev"
    }
}


resource "azurerm_lb_backend_address_pool" "lb_backend" {
    name = "BackendAdressPool"
    loadbalancer_id = azurerm_lb.lb.id
}