output "resource_group" {
  value = azurerm_resource_group.terraform.name
}

output "storage_account" {
  value = azurerm_storage_account.terraform.name
}

output "container" {
  value = azurerm_storage_container.tfstate.name
}
