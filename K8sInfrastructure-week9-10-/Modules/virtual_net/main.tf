/*----------------------------------------------------------------------------------------*/
# Create a virtual network
/*----------------------------------------------------------------------------------------*/
resource "azurerm_virtual_network" "vnet" {
  name                = var.VnetName
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.Resouce_group_name
  tags = {
    name = var.tags
  }
}