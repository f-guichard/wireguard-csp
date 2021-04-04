
terraform {
  required_version = ">= 0.14"
  required_providers {
    flexibleengine = {
      version = "~> 1.18"
# Could not retrieve the list of available versions for provider hashicorp/fe:
# provider registry registry.terraform.io does not have a provider named
# registry.terraform.io/hashicorp/fe
      source = "FlexibleEngineCloud/flexibleengine"
    }
    google = {
      version = "~> 3.58"
    }
  }
}

