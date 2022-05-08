/*----------------------------------------------------------------------------------------*/
# Creat a subnet 
/*----------------------------------------------------------------------------------------*/
resource "azurerm_subnet" "Web_Tier" {
  name                 = var.public_subnet_name
  resource_group_name  = var.Resouce_group_name
  virtual_network_name = var.VnetName
  address_prefixes     = var.public_address_space

}
/*----------------------------------------------------------------------------------------*/


