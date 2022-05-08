

/* terraform{
    backend "azurerm" {
    resource_group_name  = var.resource_group_name
    storage_account_name = azurerm_storage_account.Storage1.name
    container_name       = azurerm_storage_container.tfstate.name
    key                  = "terraform.tfstate"
  }
} */