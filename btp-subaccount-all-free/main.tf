terraform {
  required_providers {
    btp = {
      source  = "sap/btp"
      version = "0.1.0-beta1"
    }
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = "0.50.8"
    }
  }
}

variable "admin_user" {}
variable "admin_password" {}
variable "globalaccount_subdomain" {}

# SAP BTP provider configuration
provider "btp" {
  globalaccount = var.globalaccount_subdomain
  username      = var.admin_user
  password      = var.admin_password
}

# Manage subaccount (create subaccount at Global Account level)
resource "btp_subaccount" "dev" {
  name        = "free-sandbox"
  subdomain   = "free-sandbox-ejzl2vx1"   # it must be unique in SAP BTP
  region      = "ap10"
  description = "Sandbox with all free services"
}

# Manage Cloud Foundry environment (create CF ORG at Subaccount level)
resource "btp_subaccount_environment_instance" "cloudfoundry" {
  subaccount_id    = btp_subaccount.dev.id
  name             = "free-sandbox-cf-env"
  environment_type = "cloudfoundry"
  service_name     = "cloudfoundry"
  plan_name        = "free"

  parameters = jsonencode({
    instance_name = "free-sandbox-cf-org"   # it must be unique in the region
  })
}

provider "cloudfoundry" {
  # api_url  = local.json_data_labels["API Endpoint"]
  api_url  = "https://api.cf.ap10.hana.ondemand.com"
  user     = var.admin_user
  password = var.admin_password
}

# CF Spaces
resource "cloudfoundry_space" "dev" {
  name = "dev"
  org  = btp_subaccount_environment_instance.cloudfoundry.platform_id
}
