locals {
  environment_name        = var.environment_name
  resource_group_name     = "rg-test-${local.environment_name}-001"
  location                = "eastus"
  allowed_virtual_networks = [ for s in var.allowed_subnet_ids : {
    action = "Allow"
    subnet_id = "s"
  }]
    
}
