
#################################################################
##                                                             ##
## avirtual machine for the pipelne agent and the ansible host ##
##                                                             ##
#################################################################

resource "azurerm_public_ip" "linux_vm_Ip" {
  name                = var.linux_vm_Ip_name
  location            = var.location
  resource_group_name = var.Resouce_group_name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "linux_vm_nic" {
  name                = var.linux_vm_nic_Name
  location            = var.location
  resource_group_name = var.Resouce_group_name

  ip_configuration {
    name                          = "${var.linux_vm_nic_Name}-Configuration"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux_vm_Ip.id
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm_Name" {
  name                            = var.linux_vm_Name
  location                        = var.location
  resource_group_name             = var.Resouce_group_name
  network_interface_ids           = [azurerm_network_interface.linux_vm_nic.id]
  size                            = "Standard_E2_v3" #Standard_B1ls
  admin_username                  = var.admin_user_name
  admin_password                  = var.admin_password
  disable_password_authentication = false
  custom_data                     = filebase64("Modules/scripts/AgentConfigScript.sh") 
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  tags = {
    name = var.tags
  }

}


