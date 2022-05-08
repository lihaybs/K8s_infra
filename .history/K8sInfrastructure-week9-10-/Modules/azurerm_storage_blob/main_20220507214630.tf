
resource "azurerm_storage_account" "Storage1" {
  name                     = var.storage_account_Name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.Storage1.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "example" {
  name                   = "teraform.tfstate"
  storage_account_name   = azurerm_storage_account.Storage1.name
  storage_container_name = azurerm_storage_container.tfstate.name
  type                   = "Block"
}
