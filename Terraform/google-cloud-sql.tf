###########################
# @author Elias De Hondt  #
# @since 18/11/2024       #
###########################
# Description: This file contains the configuration for the Google Cloud SQL instance.
resource "google_sql_database_instance" "cloud-sql-instance" {
    name = "cloud-sql-instance"
    region = var.datacenter.region
    database_version = var.database.version
    depends_on = [google_service_networking_connection.vpc_peering]
    settings {
        tier = var.database.tier
        ip_configuration {
            ipv4_enabled = false # Ensures no public IP is assigned
            private_network = google_compute_network.vpc-network.self_link
            }
        }
}

resource "google_sql_database" "database-postgresql" { # Database for application
    name = "database-postgresql"
    instance = google_sql_database_instance.cloud-sql-instance.name
}

resource "google_sql_database" "keycloak" { # Database for Keycloak
    name = "keycloak"
    instance = google_sql_database_instance.cloud-sql-instance.name
}

resource "google_sql_user" "database-user" {
    name = "database-user"
    instance = google_sql_database_instance.cloud-sql-instance.name
    password = var.database.password
}