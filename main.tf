resource "azurerm_network_security_group" "nsg" {
  name                = local.network_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = var.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = local.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.10.10.0/24"]

    subnet {
    name           = "subnet1"
    address_prefix = "10.10.10.0/27"
    security_group = azurerm_network_security_group.nsg.id
  }
  depends_on = [ azurerm_network_security_group.nsg ]
}