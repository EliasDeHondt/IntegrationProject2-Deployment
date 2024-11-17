###########################
# @author Elias De Hondt  #
# @since 18/11/2024       #
###########################
# Description: This file contains the configuration for the Google Cloud SQL instance.
resource "google_sql_database_instance" "cloud-sql-instance" {
    name = "cloud-sql-instance"
    region = var.datacenter.region
    database_version = var.database.version
    settings {
        tier = var.database.tier
    }
}

resource "google_sql_database" "database-postgresql" {
    name = "database-postgresql"
    instance = google_sql_database_instance.cloud-sql-instance.name
}

resource "google_sql_user" "database-user" {
    name = "database-user"
    instance = google_sql_database_instance.cloud-sql-instance.name
    password = var.database.password
}