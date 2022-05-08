
output "container_name"{
  value=azurerm_storage_container.tfstate.name
}
output "storage_account_name"{
  value=azurerm_storage_account.Storage1.name
}
