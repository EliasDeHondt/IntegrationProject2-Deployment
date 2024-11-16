###########################
# @author Elias De Hondt  #
# @since 18/11/2024       #
###########################
# Description: This file contains the configuration for the Kubernetes cluster.
resource "google_project_service" "kubernetes_engine" {
    project = var.projectid
    service = "container.googleapis.com"
}

resource "google_container_cluster" "kubernetes-cluster" {
    name = var.kubernetes.cluster_name
    location = var.datacenter.region
    initial_node_count = var.kubernetes.node_count
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