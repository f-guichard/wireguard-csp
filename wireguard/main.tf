resource "google_compute_network" "vpc_cloudfoundry" {
  name                    	  = var.gcp_vpc_name
  auto_create_subnetworks 	  = var.gcp_vpc_auto_networks
  ## Special dedicace GG
  routing_mode		  	  = var.gcp_vpc_routing_mode
  mtu  				  = var.gcp_vpc_mtu
  delete_default_routes_on_create = var.gcp_vpc_no_default_route
}

resource "google_compute_subnetwork" "subnet_cloudfoundry_wireguard" {
  name          = var.subnet_cloudfoundry_wireguard_name
  ip_cidr_range = var.subnet_cloudfoundry_wireguard_cidr
  network       = google_compute_network.vpc_cloudfoundry.name

  log_config {
    aggregation_interval = var.subnet_cloudfoundry_wireguard_agg_int
    flow_sampling        = var.subnet_cloudfoundry_wireguard_flow_sampling
    metadata             = var.subnet_cloudfoundry_wireguard_metadata
  }
}


resource "google_compute_subnetwork" "subnet_cloudfoundry_cfmix_cp1" {
  name          = var.subnet_cloudfoundry_cfmix_cp1_name
  ip_cidr_range = var.subnet_cloudfoundry_cfmix_cp1_cidr
  network       = google_compute_network.vpc_cloudfoundry.name

  log_config {
    aggregation_interval = var.subnet_cloudfoundry_cfmix_cp1_agg_int
    flow_sampling        = var.subnet_cloudfoundry_cfmix_cp1_flow_sampling
    metadata             = var.subnet_cloudfoundry_cfmix_cp1_metadata
  }
}

resource "google_compute_subnetwork" "subnet_cloudfoundry_cfmix_priv1" {
  name          = var.subnet_cloudfoundry_cfmix_priv1_name
  ip_cidr_range = var.subnet_cloudfoundry_cfmix_priv1_cidr
  network       = google_compute_network.vpc_cloudfoundry.name

  log_config {
    aggregation_interval = var.subnet_cloudfoundry_cfmix_priv1_agg_int
    flow_sampling        = var.subnet_cloudfoundry_cfmix_priv1_flow_sampling
    metadata             = var.subnet_cloudfoundry_cfmix_priv1_metadata
  }
}

resource "google_compute_subnetwork" "subnet_cloudfoundry_cfmix_pub1" {
  name          = var.subnet_cloudfoundry_cfmix_pub1_name
  ip_cidr_range = var.subnet_cloudfoundry_cfmix_pub1_cidr
  network       = google_compute_network.vpc_cloudfoundry.name

  log_config {
    aggregation_interval = var.subnet_cloudfoundry_cfmix_pub1_agg_int
    flow_sampling        = var.subnet_cloudfoundry_cfmix_pub1_flow_sampling
    metadata             = var.subnet_cloudfoundry_cfmix_pub1_metadata
  }
}


resource "google_service_account" "sa_wireguard" {
  account_id   = var.gcp_wireguard_sa
  display_name = "SA pour les operations wireguard GCE"
}

resource "google_compute_instance" "wireguard_gcp" {
  depends_on   = [ google_service_account.sa_wireguard, google_compute_network.vpc_cloudfoundry ]
  name         = var.gcp_wireguard_instance_name
  machine_type = var.gcp_wireguard_machine_type
  ## A trasher via le provider
  zone	       = var.gcp_wireguard_az1

  tags = var.gcp_wireguard_gce_fwl_tags

  boot_disk {
    initialize_params {
      image = var.gcp_wireguard_os_image
    }
  }

  network_interface {
    network = google_compute_network.vpc_cloudfoundry.id

    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = "file('config-templates/metadata_startup_script')"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.sa_wireguard.email
    scopes = ["cloud-platform"]
  }
}
