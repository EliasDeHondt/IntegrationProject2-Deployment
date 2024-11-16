###########################
# @author Elias De Hondt  #
# @since 18/11/2024       #
###########################
# Description: This file contains the variables for all the Terraform configurations.
projectid = "integrationproject2-deployment"
credentials_file = "credentials.json"

datacenter = {
    region = "us-central1"
    zone = "us-central1-c"
}

database = {
    version = "POSTGRES_17"
    password = "123"
    name = "database-postgresql"
    tier = "db-f1-micro"
}

kubernetes = {
    cluster_name = "cluster-1"
    node_count = 3
    node_config = {
        machine_type = "n1-standard-1"
        disk_size_gb = 20
        disk_type = "pd-standard"
    }
}