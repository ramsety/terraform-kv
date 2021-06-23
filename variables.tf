variable "KV_NAME" {
    description = "Value of the  KeyVault"
    type = string
    default = "test"
}

variable "RG_NAME" {
    description = "Value of the resource group"
    type = string
    default = "test"
}

variable "environment_name" {
    description = "Value of the environment where acr will be deployed"
    type = string
    default = "test"
}

variable "location" {
    description = "Value of the location where container registry to be created"
    type = string
    default = "eastus"
}
}
