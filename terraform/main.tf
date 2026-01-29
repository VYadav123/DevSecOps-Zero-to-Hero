provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "vault-demo-rg1"
  location = "East US"
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
