## ----------------------- Variables providers --------------------------------------------

variable "gcp_secret_key_json" {
  type		= string
  description	= "json contenant les credentials pour le service account terraform"
}

variable "gcp_region" {
  type		= string
  description	= "Region de deploiement"
}

variable "gcp_project" {
  type		= string
  description	= "project GCP contenant le SA"
}

## ----------------------- Variables VPC CloudFoundry-Mix  --------------------------------------------

variable "gcp_vpc_name" {
  type		= string
  description	= "Nom du VPC CF-Mix"
}

variable "gcp_vpc_auto_networks" {
  default	= false
  description	= "false/true -> generation automatique d'un reseau network"
}

variable "gcp_vpc_routing_mode" {
  type		= string
  default	= "REGIONAL"
  description	= "REGIONAL ou GLOBAL"
}

variable "gcp_vpc_mtu" {
  type 		= string
  default	= 1500
  description	= "MTU"
}

variable "gcp_vpc_no_default_route" {
  default	= false
  description	= "true: supprime la route par defaut pour le subnet"
}

## ----------------------- Variables Wireguard GCE --------------------------------------------

variable "subnet_cloudfoundry_wireguard_name" {
  type		= string
  description	= "Nom du subnet pour wireguard"
}

variable "subnet_cloudfoundry_wireguard_cidr" {
  type		= string
  description	= "cidr du subnet wireguard"
}

variable "subnet_cloudfoundry_wireguard_agg_int" {
  type		= string
  default	= "INTERVAL_5_MIN"
  description	= "INTERVAL_5_MIN, INTERVAL_10_MIN, INTERVAL_15_MIN"
}

variable "subnet_cloudfoundry_wireguard_flow_sampling" {
  type		= string
  default	= "0.1"
  description	= "% de traffic "
}

variable "subnet_cloudfoundry_wireguard_metadata" {
  type		= string
  default	= "INCLUDE_ALL_METADATA"
  description	= "Metadonnees à exporter"
}

## ----------------------- Variables Subnet CP1 CF-Mix GCP --------------------------------------------
## On duplique -> Faire un module

variable "subnet_cloudfoundry_cfmix_cp1_name" {
  type		= string
  description	= "Nom du subnet pour le controle plane az1"
}

variable "subnet_cloudfoundry_cfmix_cp1_cidr" {
  type		= string
  description	= "cidr du subnet cfmix cp1"
}

variable "subnet_cloudfoundry_cfmix_cp1_agg_int" {
  type		= string
  default	= "INTERVAL_5_MIN"
  description	= "INTERVAL_5_MIN, INTERVAL_10_MIN, INTERVAL_15_MIN"
}

variable "subnet_cloudfoundry_cfmix_cp1_flow_sampling" {
  type		= string
  default	= "0.1"
  description	= "% de traffic "
}

variable "subnet_cloudfoundry_cfmix_cp1_metadata" {
  type		= string
  default	= "INCLUDE_ALL_METADATA"
  description	= "Metadonnees à exporter"
}


## ----------------------- Variables Subnet PRIV1 CF-Mix GCP --------------------------------------------
## On duplique -> Faire un module

variable "subnet_cloudfoundry_cfmix_priv1_name" {
  type		= string
  description	= "Nom du subnet pour les diego cells privees az1"
}

variable "subnet_cloudfoundry_cfmix_priv1_cidr" {
  type		= string
  description	= "cidr du subnet cfmix dp-priv1"
}

variable "subnet_cloudfoundry_cfmix_priv1_agg_int" {
  type		= string
  default	= "INTERVAL_5_MIN"
  description	= "INTERVAL_5_MIN, INTERVAL_10_MIN, INTERVAL_15_MIN"
}

variable "subnet_cloudfoundry_cfmix_priv1_flow_sampling" {
  type		= string
  default	= "0.1"
  description	= "% de traffic "
}

variable "subnet_cloudfoundry_cfmix_priv1_metadata" {
  type		= string
  default	= "INCLUDE_ALL_METADATA"
  description	= "Metadonnees à exporter"
}

## ----------------------- Variables Subnet PUB1 CF-Mix GCP --------------------------------------------
## On duplique -> Faire un module

variable "subnet_cloudfoundry_cfmix_pub1_name" {
  type		= string
  description	= "Nom du subnet pour les diego cells publiques az1"
}

variable "subnet_cloudfoundry_cfmix_pub1_cidr" {
  type		= string
  description	= "cidr du subnet af dp-pub1"
}

variable "subnet_cloudfoundry_cfmix_pub1_agg_int" {
  type		= string
  default	= "INTERVAL_5_MIN"
  description	= "INTERVAL_5_MIN, INTERVAL_10_MIN, INTERVAL_15_MIN"
}

variable "subnet_cloudfoundry_cfmix_pub1_flow_sampling" {
  type		= string
  default	= "0.1"
  description	= "% de traffic "
}

variable "subnet_cloudfoundry_cfmix_pub1_metadata" {
  type		= string
  default	= "INCLUDE_ALL_METADATA"
  description	= "Metadonnees à exporter"
}

## ----------------------- Variables Wireguard GCE --------------------------------------------

variable "gcp_wireguard_sa" {
  type		= string
  description	= "Label du service account GCE pour wireguard"
}

variable "gcp_wireguard_instance_name" {
  type		= string
  description	= ""
}

variable "gcp_wireguard_machine_type" {
  type		= string
  description	= "Gabarit de la machine"
}

variable "gcp_wireguard_az1" {
  type		= string
  description	= "zone pour l'instance wireguard"
}

variable "gcp_wireguard_gce_fwl_tags" {
  type		= list
  description	= "protocoles à autoriser niveau fwl"
}

variable "gcp_wireguard_os_image" {
  type		= string
  description	= "OS à booter"
}

variable "gcp_genereic_startup_script" {
  type		= string
  default	= "sudo apt-get update -y && sudo apt-get upgrade -y"
  description	= "script automatique à la création"
}
