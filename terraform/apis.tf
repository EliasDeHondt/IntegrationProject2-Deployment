###########################
# @author Elias De Hondt  #
# @since 18/11/2024       #
###########################
# Description: This file contains the configuration for the APIs.
resource "google_project_service" "cloud_sql" { # Google Cloud SQL API
    project = var.projectid
    service = "sqladmin.googleapis.com"
    lifecycle {
        prevent_destroy = true
    }
}

resource "google_project_service" "kubernetes_engine" { # Google Kubernetes Engine API
    project = var.projectid
    service = "container.googleapis.com"
    lifecycle {
        prevent_destroy = true
    }
}

resource "google_project_service" "compute_engine" { # Google Compute Engine API
    project = var.projectid
    service = "compute.googleapis.com"
    lifecycle {
        prevent_destroy = true
    }
}

resource "google_project_service" "resource_manager" { # Google Cloud Resource Manager API
    project = var.projectid
    service = "cloudresourcemanager.googleapis.com"
    lifecycle {
        prevent_destroy = true
    }
}

resource "google_project_service" "iam" { # Google Identity and Access Management API
    project = var.projectid
    service = "iam.googleapis.com"
    lifecycle {
        prevent_destroy = true
    }
}

resource "google_project_service" "service_networking" { # Google Service Networking API
    project = var.projectid
    service = "servicenetworking.googleapis.com"
    lifecycle {
        prevent_destroy = true
    }
}