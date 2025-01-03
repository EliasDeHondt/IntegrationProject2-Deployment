###########################
# @author Elias De Hondt  #
# @since 18/11/2024       #
###########################
# Description: This file contains the provider configuration for the Google Cloud Platform.
terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "3.5.0"
        }
    }
}

provider "google" {
    credentials = file(var.credentials_file)

    project = var.projectid
    region = var.datacenter.region
    zone = var.datacenter.zone
}

provider "google-beta" {
    credentials = file(var.credentials_file)

    project = var.projectid
    region = var.datacenter.region
    zone = var.datacenter.zone
}