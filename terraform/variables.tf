###########################
# @author Elias De Hondt  #
# @since 18/11/2024       #
###########################
# Description: This file contains the variables for all the Terraform configurations.
variable "projectid" {
    description = "The Google Cloud project ID"
    type = string
}

variable "credentials_file" {
    description = "The path to the credentials JSON file"
    type = string
}

variable "datacenter" {
    description = "Datacenter configuration"
    type = object({
        region = string
        zone = string
    })
}

variable "database" {
    description = "Database configuration"
    type = object({
        version = string
        password = string
        tier = string
    })
}

variable "kubernetes" {
    description = "Kubernetes cluster configuration"
    type = object({
        cluster_name = string
        node_count = number
        node_config = object({
            machine_type = string
            disk_size_gb = number
            disk_type = string
        })
    })
}