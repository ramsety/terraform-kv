locals {
  environment_name        = var.environment_name
  resource_group_name     = "rg-test-${local.environment_name}-001"
  location                = "eastus"  
  subnet_ids              = "10.0.0.0/24"
}
