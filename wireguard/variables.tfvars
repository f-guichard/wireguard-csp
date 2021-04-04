## ---- providers 
gcp_secret_key_json = "secrets/orange-hydcf-core-dev-sa.key"
gcp_project = "orange-hydcf-core-dev"
gcp_region = "europe-west1"

## ---- vpc
gcp_vpc_name		= "vpc-cfmix"

## ---- subnets
subnet_cloudfoundry_wireguard_name	= "wireguard-subnet"
subnet_cloudfoundry_wireguard_cidr	= "192.168.21.32/28"
subnet_cloudfoundry_cfmix_cp1_name	= "wireguard-subnet"
subnet_cloudfoundry_cfmix_cp1_cidr	= "192.168.21.48/28"
subnet_cloudfoundry_cfmix_priv1_name	= "wireguard-subnet"
subnet_cloudfoundry_cfmix_priv1_cidr	= "192.168.21.128/27"
subnet_cloudfoundry_cfmix_pub1_name	= "wireguard-subnet"
subnet_cloudfoundry_cfmix_pub1_cidr	= "192.168.21.160/27"

## ---- wireguard GCE

gcp_wireguard_sa			= "gcp-wireguard-sa"
gcp_wireguard_instance_name		= "gcp-wireguard-cfmix-exp"
### gcloud compute machine-types list --filter="name ~ cpu" --zones europe-west1-b --limit=10
gcp_wireguard_machine_type		= "e2-highcpu-2"
gcp_wireguard_az1			= "europe-west1-b"
gcp_wireguard_gce_fwl_tags		= [ "udp" ]
### gcloud compute images list --filter='name ~ ubuntu'
gcp_wireguard_os_image			= "ubuntu-minimal-2004-focal-v20210223a"
