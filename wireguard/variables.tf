variable "gcp_secret_key_json" {
  type		= string
  description	= "json contenant les credentials pour le service account terraform"
}

variable "gcp_region" {
  type		= string
  description	= "Region de deploiement"
}

variable "gcp_projet" {
  type		= string
  description	= "project GCP contenant le SA"
}
