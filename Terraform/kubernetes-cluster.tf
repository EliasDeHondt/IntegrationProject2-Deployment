###########################
# @author Elias De Hondt  #
# @since 18/11/2024       #
###########################
# Description: This file contains the configuration for the Kubernetes cluster.
resource "google_container_cluster" "kubernetes-cluster" {
    name = var.kubernetes.cluster_name
    location = var.datacenter.zone
    initial_node_count = var.kubernetes.node_count

    network = google_compute_network.vpc-network.name
    subnetwork = google_compute_subnetwork.subnetwork.name

    node_config {
        machine_type = var.kubernetes.node_config.machine_type
        disk_size_gb = var.kubernetes.node_config.disk_size_gb
        disk_type = var.kubernetes.node_config.disk_type

        oauth_scopes = [
            "https://www.googleapis.com/auth/devstorage.read_only",
            "https://www.googleapis.com/auth/logging.write",
            "https://www.googleapis.com/auth/monitoring",
            "https://www.googleapis.com/auth/servicecontrol",
            "https://www.googleapis.com/auth/service.management.readonly",
            "https://www.googleapis.com/auth/sqlservice.admin"
        ]
    }
}

resource "google_compute_network" "vpc-network" {
    name = "vpc-network"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
    name = "subnetwork"
    network = google_compute_network.vpc-network.name
    region = var.datacenter.region
    ip_cidr_range = "10.0.0.0/16" # (256^2)=65536 IPs
}

resource "google_compute_router" "router" {
    name = "router"
    network = google_compute_network.vpc-network.name
    region  = var.datacenter.region
}

resource "google_compute_router_nat" "nat" {
    name = "nat"
    router = google_compute_router.router.name
    region = var.datacenter.region

    nat_ip_allocate_option = "AUTO_ONLY"
    source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
