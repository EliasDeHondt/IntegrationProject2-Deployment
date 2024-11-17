###########################
# @author Elias De Hondt  #
# @since 18/11/2024       #
###########################
# Description: This file contains the variables for all the Terraform configurations.
projectid = "integrationproject2-project2"
credentials_file = "credentials.json"

datacenter = {
    region = "us-central1"
    zone = "us-central1-c"
}

database = {
    version = "POSTGRES_17"
    password = "123"
    tier = "db-perf-optimized-N-2" # vCPUs=2, RAM=16GB, SSD=375GB
}

kubernetes = {
    cluster_name = "cluster-1"
    node_count = 3
    node_config = {
        machine_type = "n1-standard-1" # vCPU=1, RAM=3.75GB
        disk_size_gb = 20 # SSD=20GB
        disk_type = "pd-standard"
    }
}