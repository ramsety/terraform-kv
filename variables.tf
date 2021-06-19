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

variable "allowed_subnet_ids" {
    description = "Value of the location where container registry to be created"
    type = list(string)         #check the right function
    default = subnet id's        #list of 3 subnet id's to be allowed
}