resource "azurerm_resource_group" "lab" {
 name     = "rg-provider-lab"
 location = "East US"
}

resource "google_storage_bucket" "lab" {
 name     = "gcp-provider-lab-rogerramossilva"
 location = "US"
}
