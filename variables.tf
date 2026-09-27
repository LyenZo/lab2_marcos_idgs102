variable "project_name"{
    description = "The name of the project"
    type        = string
    validation {
        condition     = length(var.project_name) >= 5 && length(var.project_name) <= 20
        error_message = "The project name must be between 5 and 20 characters long."
    }
}

variable "environment" {
    description = "The environment of the project"
    type        = string
    validation {
        condition     = contains(["dev", "qa", "prod"], var.environment)
        error_message = "The environment must be one of: dev, qa, prod."
    }
}

variable "location" {
    description = "The Azure region where resources will be deployed"
    type        = string
    default    = "northcentralus"
    validation {
        condition     = contains(["eastus", "westus", "centralus", "northcentralus"], var.location)
        error_message = "The location must be one of: eastus, westus, centralus, northcentralus."
    }
}

variable "vnet_address_space" {
    description = "The address space for the virtual network"
    type        = list(string)
    default     = ["10.0.0.0/16"]
    }

variable tags {
    description = "A map of tags to assign to the resources"
    type        = map(string)
    default     = {
        "managed by" = "terraform" 
        }
}

variable "subscription_id" {
    description = "The Azure subscription ID"
    type        = string
    default     = "f55666bf-f417-40d5-80f5-a5c2495948d0"
    sensitive   = true
}