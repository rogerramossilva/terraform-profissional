resource "azurerm_resource_group" "terraform" {
  name     = var.resource_group_name
  location = var.location
}


resource "azurerm_storage_account" "terraform" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.terraform.name
  location                 = azurerm_resource_group.terraform.location

  account_tier              = "Standard"
  account_replication_type  = "LRS"
}


resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.terraform.id
  container_access_type  = "private"
}
