provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "vault-demo-rg"
  location = "Central India"
}

resource "azurerm_storage_account" "example" {
  name                     = "vaultstorage${random_id.suffix.hex}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "random_id" "suffix" {
  byte_length = 4
}
