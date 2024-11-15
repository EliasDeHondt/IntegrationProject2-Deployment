# Description: This file contains the configuration for the Google Cloud SQL instance.
resource "google_sql_database_instance" "database-postgresql" {
    name = "database-postgresql"
    region = var.datacenter.region
    database_version = var.database.database_version
    settings {
        tier = var.database.tier
    }
}

resource "google_sql_user" "database-user" {
    name = "database-user"
    instance = var.google_sql_database_instance.database-postgresql.name
    password = var.database_password
}