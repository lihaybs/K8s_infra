









##################################################################         
##################################################################    
##                                                              ##       
##         MODULE LIST                                          ##       
##                                                              ##        
##  1. resource group module                                    ##
##  2. storage blob module                                      ##
##  3. virtual network module                                   ##
##  4. subnets module                                           ##
##  5. linux virtual machine module (azure devops ci/cd agent)  ##
##                                                              ##  
##                                                              ##  
##################################################################
##################################################################

module "RG" {

  source = "./Modules/resource_group"

  Resouce_group_name = var.RG
  location           = var.location
}


module "azurerm_storage_blob" {

  source = "./Modules/azurerm_storage_blob"

  storage_account_Name = var.storage_account_Name
  resource_group_name  = module.RG.Resouce_group_name
  location             = module.RG.location

}


module "Vnet" {

  source = "./Modules/virtual_net"

  address_space      = var.Vnet_address_space_prefixes
  VnetName           = var.VnetName
  Resouce_group_name = module.RG.Resouce_group_name
  location           = module.RG.location
  tags               = var.tags

}


module "Subnets" {

  source = "./Modules/subnets"


  public_address_space  = var.public_address_space
  private_address_space = var.private_address_space
  VnetName              = module.Vnet.vnet_name
  Resouce_group_name    = module.RG.Resouce_group_name
  /* private_subnet_name   = var.private_subnet_name */
  public_subnet_name    = var.public_subnet_name
  tags                  = var.tags

}


module "Agent" {

  source = "./Modules/Linux_vm"

  Resouce_group_name = module.RG.Resouce_group_name
  location           = module.RG.location
  tags               = var.tags
  VnetName           = module.Vnet.vnet_name
  linux_vm_Name      = var.linux_vm_Name
  linux_vm_nic_Name  = var.linux_vm_nic_Name
  linux_vm_Ip_name   = var.linux_vm_Ip_name
  admin_user_name    = var.admin_user_name
  admin_password     = var.admin_password
  subnet_id          = module.Subnets.public_subnet_id

}
###############################################################################################################




####################################################
####################################################
##                                                ##
##                                                ##
##    CONTAINER REG TO STORE OUR IMAGE CONTAINER  ##
##                                                ##
##                                                ##
####################################################
####################################################
resource "azurerm_container_registry" "acrforapp" {
  name                = var.acr_name
  resource_group_name = module.RG.Resouce_group_name
  location            = module.RG.location
  sku                 = "standard"
  admin_enabled       = true
}

####################################################
####################################################
##                                                ##
##                                                ##
##    azure managed kubernates cluster            ##  
##                                                ##
##                                                ##
##                                                ##
####################################################
####################################################
resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  resource_group_name = module.RG.Resouce_group_name
  location            = module.RG.location
  dns_prefix          = var.cluster_name
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = "apppool1"
    node_count = var.node_count
    vm_size    = "Standard_D2s_v4"
  }
    service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "kubenet"
  }

  tags = {
    Environment = "Production"
  }
}

###############################################################################################################
###############################################################################################################
############################################################################################################### 

