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

variable "allowed_subnet" {
    description = "Value of the location where container registry to be created"
    type = map       
    default = {
        "allowed_subnet_ids" = "10.0.0.0/25"
        }
}
