# for more readable tamplate we devide as much as possible 
# this section is for the network security groups we need 

/*----------------------------------------------------------------------------------------*/
# A NETWORK SECURITY GROUP PLUS AN ASSOSIATION TO THE WEB TIER SUBNET 
# this network security group will have the azure standard plus an openning of port 8080 
#  to startlistaning for app request 
/*----------------------------------------------------------------------------------------*/
resource "azurerm_subnet_network_security_group_association" "NSG1" {
  subnet_id                 = module.Subnets.public_subnet_id
  network_security_group_id = azurerm_network_security_group.NSG1.id

}

resource "azurerm_network_security_group" "NSG1" {
  name                = "NSG1"
  
  resource_group_name = module.RG.Resouce_group_name
  location            = module.RG.location
  security_rule {
    name                       = "ssh"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "Allow_8080"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

/*----------------------------------------------------------------------------------------*/


/*----------------------------------------------------------------------------------------*/
/* A NETWORK SECURITY GROUP PLUS AN ASSOSIATION TO THE DATA TIER SUBNET                   */
/*----------------------------------------------------------------------------------------*/

/* resource "azurerm_subnet_network_security_group_association" "NSG2_association" {
  subnet_id                 = module.Subnets.public_subnet_id
  network_security_group_id = azurerm_network_security_group.NSG2.id

} */
/* BECAUSE WE WANT THE DATA TIER TO REMAINE "HIDDEN" TO OUTSIDE EYES WE CAN LEAVE THE STANDARD  */
/* AZURE NSG BLOCK THAT ALLOWS ONLY INSIDE NETWORK COMUNICATIONS                                */
/* resource "azurerm_network_security_group" "NSG2" {
  name                = "NSG2"
  location            = var.location
  resource_group_name = var.RG */

/* security_rule {
    name                       = "Postgres"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "5432"
    destination_port_range     = "5432"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
  } */
/* security_rule {
    name                       = "controller access"
    priority                   = 111
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22"
    destination_port_range     = "22"
    source_address_prefix      = "79.178.9.59"
    destination_address_prefix = "*"
  }

} */

