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
        time = {
            source  = "hashicorp/time"
            version = "~> 0.9"
        }
    }
}

provider "google" {
    credentials = file(var.credentials_file)

    project = var.projectid
    region = var.datacenter.region
    zone = var.datacenter.zone
}

resource "time_sleep" "wait_for_apis" {
    depends_on = [google_project_service.enable_apis]
    create_duration = "30s"
}