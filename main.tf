terraform {
backend "azurerm" {
    resource_group_name   = "rg-kvgrp"
    storage_account_name  = "kvstrggrp"
    container_name        = "kvcntnr"
    key                   = "Bp89Yl4sdB5/VR0y5DNJN3o3HTea4ulddNXBAxuOdocjm1JT3lWRBNQorpRLEs2s8q2kGbTe4oFtVPZRjcmMaw=="
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
  resource_group_name         = "rg-kvgrp"
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
}
