###########################
# @author Elias De Hondt  #
# @since 18/11/2024       #
###########################
# Description: This file contains the configuration for the Google Cloud SQL instance.
resource "google_project_service" "cloud_sql" {
    project = var.projectid
    service = "sqladmin.googleapis.com"
}

resource "google_sql_database_instance" "database-postgresql" {
    name = "database-postgresql"
    region = var.datacenter.region
    database_version = var.database.version
    settings {
        tier = var.database.tier
    }
}

resource "google_sql_user" "database-user" {
    name = "database-user"
    instance = var.database.name
    password = var.database.password
}