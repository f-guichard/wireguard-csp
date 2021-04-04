provider "google" {
  project     = var.gcp_project
  credentials = file(var.gcp_secret_key_json)
  region      = var.gcp_region
}

provider "flexibleengine" {
  auth_url = "https://iam.eu-west-0.prod-cloud-ocb.orange-business.com/v3"
}
