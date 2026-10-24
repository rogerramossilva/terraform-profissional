resource "azurerm_resource_group" "dev" {
  provider = azurerm.dev
  name     = "rg-dev"
  location = "East US"
}
