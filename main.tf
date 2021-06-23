terraform {
backend "azurerm" {
    resource_group_name   = var.RG_NAME
    storage_account_name  = "tfstateac"
    container_name        = "tfstate"
    key                   = "BXNSxGxwugWitklqE6wOTSe2+PkxGPgNtriZrLgkY6tiwaCzkr/owQS8UUmfoZzSwLK2yJckMXMgXxz0P2qAEw=="
}
}
provider "azurerm" {
  version = ">=2.0"
  # The "feature" block is required for AzureRM provider 2.x.
  features {}
}

resource "azurerm_key_vault" "evalkv" {
  name                        = var.KV_NAME
  location                    = "East US"
  resource_group_name         = "eval-rg"
  enabled_for_disk_encryption = true
  tenant_id                   = "70982e01-16e3-4267-9e23-83394bd1a9e8"
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = "70982e01-16e3-4267-9e23-83394bd1a9e8"
    object_id = "f009dcdd-414d-4732-8c42-c4ab68934415"

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
network_rules {
    default_action             = "Allow"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = ["/subscriptions/8d499e57-3675-4d06-ae05-1fe9de2b0f16/resourceGroups/eval-rg/providers/Microsoft.Network/virtualNetworks/eval-vnet-01/subnets/subnet-01", "/subscriptions/8d499e57-3675-4d06-ae05-1fe9de2b0f16/resourceGroups/eval-rg/providers/Microsoft.Network/virtualNetworks/eval-vnet-01/subnets/subnet-02", "/subscriptions/8d499e57-3675-4d06-ae05-1fe9de2b0f16/resourceGroups/eval-rg/providers/Microsoft.Network/virtualNetworks/eval-vnet-01/subnets/subnet-03"]
}
}
