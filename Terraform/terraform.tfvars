###########################
# @author Elias De Hondt  #
# @since 18/11/2024       #
###########################
# Description: This file contains the variables for all the Terraform configurations.
projectid = "ip2-kubernetes"
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
    node_count = 5
    node_config = {
        #machine_type = "n1-standard-1" # vCPU=1, RAM=3.75GB
        machine_type = "n1-standard-2" # vCPU=2, RAM=7.5GB
        #machine_type = "n1-standard-4" # vCPU=4, RAM=15GB
        #machine_type = "n1-standard-8" # vCPU=8, RAM=30GB
        disk_size_gb = 40 # SSD=40GB
        disk_type = "pd-standard"
    }
}
