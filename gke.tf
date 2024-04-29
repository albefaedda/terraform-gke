module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  name                       = var.name
  region                     = var.region
  zones                      = var.zones
  network                    = var.network
  subnetwork                 = var.subnet
  ip_range_pods              = ""
  ip_range_services          = ""
  http_load_balancing        = false
  network_policy             = true
  remove_default_node_pool   = true

  node_pools = [
    {
      name               = var.node_pool_mame
      machine_type       = var.machine_type
      node_locations     = join(",", var.zones)      # use join(",", var.zones) if creating a multi-zone node pool
      min_count          = var.min_count
      max_count          = var.max_count
      disk_type          = var.disk_type
      disk_size_gb       = var.disk_size_gb
      service_account    = var.service_account
      preemptible        = false
      initial_node_count = var.initial_node_count
    },
  ]
}