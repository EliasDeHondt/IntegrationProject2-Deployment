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

    private_cluster_config {
        enable_private_nodes    = true
        enable_private_endpoint = false
        master_ipv4_cidr_block  = "10.3.0.0/28"
    }

    ip_allocation_policy {
        cluster_secondary_range_name  = "cluster-range"  # Use the secondary range for pods
        services_secondary_range_name = "service-range"
    }

    master_authorized_networks_config {
        cidr_blocks {
            cidr_block   = "0.0.0.0/0" #All for testing
            display_name = "Internal Network"
        }
    }

    remove_default_node_pool = true
}

resource "google_container_node_pool" "node-pool" {
    name       = "custom-node-pool"
    cluster    = google_container_cluster.kubernetes-cluster.name
    location   = var.datacenter.zone
    initial_node_count = var.kubernetes.node_count

    node_config {
        machine_type = var.kubernetes.node_config.machine_type
        disk_size_gb = var.kubernetes.node_config.disk_size_gb
        disk_type    = var.kubernetes.node_config.disk_type

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

resource "google_compute_global_address" "google_managed_services" {
    name = "google-managed-services"
    purpose = "VPC_PEERING"
    address_type = "INTERNAL"
    address = "192.168.0.0"
    prefix_length = 16
    network = google_compute_network.vpc-network.name
    description = "IP range for the Database"
}

resource "google_service_networking_connection" "vpc_peering" {
    depends_on=[google_compute_network.vpc-network]
    network = google_compute_network.vpc-network.name
    service = "servicenetworking.googleapis.com"
    reserved_peering_ranges = [google_compute_global_address.google_managed_services.name]
}

resource "google_compute_subnetwork" "subnetwork" {
    name = "subnetwork"
    network = google_compute_network.vpc-network.name
    region = var.datacenter.region
    ip_cidr_range = "10.0.0.0/16"
    private_ip_google_access = true
    
    secondary_ip_range {
        range_name = "cluster-range"
        ip_cidr_range = "10.1.0.0/16"
    }

    secondary_ip_range {
	range_name = "service-range"
        ip_cidr_range = "10.2.0.0/16"
    }

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

resource "google_compute_global_address" "private_peering_address" {
    name = "private-peering-address"
    purpose = "VPC_PEERING"
    address_type = "INTERNAL"
    prefix_length = 16
    network = google_compute_network.vpc-network.id
}

resource "google_service_networking_connection" "net-con" {
    network = google_compute_network.vpc-network.id
    service = "servicenetworking.googleapis.com"
    reserved_peering_ranges = [google_compute_global_address.private_peering_address.name]
}
