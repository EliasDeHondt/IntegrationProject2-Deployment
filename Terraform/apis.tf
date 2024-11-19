###########################
# @author Elias De Hondt  #
# @since 18/11/2024       #
###########################
# Description: This file contains the configuration for the APIs.
resource "google_project_service" "enable_apis" {
    for_each = toset([
        "sqladmin.googleapis.com",              # Google Cloud SQL API
        "container.googleapis.com",             # Google Kubernetes Engine API
        "compute.googleapis.com",               # Google Compute Engine API
        "cloudresourcemanager.googleapis.com",  # Google Cloud Resource Manager API
        "iam.googleapis.com",                   # Google Identity and Access Management API
        "servicenetworking.googleapis.com"      # Google Service Networking API
    ])
    project = var.projectid
    service = each.key
}