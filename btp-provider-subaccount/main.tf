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
  name        = "my-terraform-dev"
  subdomain   = "dev-terraform-ejzl2vx1"   # it must be unique in SAP BTP
  region      = "us10"
  description = "This was created by Terraform"
}

# Assign role collection Subaccount Administrator to users
resource "btp_subaccount_role_collection_assignment" "subaccount-viewer" {
  subaccount_id        = btp_subaccount.dev.id
  role_collection_name = "Subaccount Viewer"
  user_name            = var.admin_user
}

# Configure subaccount entitlement, add service SAP Business Application Studio
resource "btp_subaccount_entitlement" "bas" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "sapappstudiotrial"
  plan_name     = "trial"
}

# Configure subaccount entitlement, add service Alert Notification
resource "btp_subaccount_entitlement" "alert" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "alert-notification"
  plan_name     = "standard"
}

# Configure subaccount entitlement, add quota to Cloud Foundry Runtime
resource "btp_subaccount_entitlement" "cloudfoundry" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "APPLICATION_RUNTIME"
  plan_name     = "MEMORY"
  amount        = 1     # It allocates 1GB to the subaccount
}

# Manage Cloud Foundry environment (create CF ORG at Subaccount level)
resource "btp_subaccount_environment_instance" "cloudfoundry" {
  subaccount_id    = btp_subaccount.dev.id
  name             = "my-cf-environment"
  environment_type = "cloudfoundry"
  service_name     = "cloudfoundry"
  plan_name        = "standard"

  parameters = jsonencode({
    instance_name = "mlauffer-cf-org-x01"   # it must be unique in the region
  })
}

provider "cloudfoundry" {
  api_url  = "https://api.cf.us10-001.hana.ondemand.com"
  user     = var.admin_user
  password = var.admin_password
}

# CF Spaces
resource "cloudfoundry_space" "dev" {
  name = "dev"
  org  = btp_subaccount_environment_instance.cloudfoundry.platform_id
}
