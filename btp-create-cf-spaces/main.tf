terraform {
  required_providers {
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = "0.50.8"
    }
  }
}

variable "admin_user" {}
variable "admin_password" {}
variable "cf_org_name" {}
variable "cf_org_id" {}

provider "cloudfoundry" {
  api_url  = "https://api.cf.ap10.hana.ondemand.com"
  user     = var.admin_user
  password = var.admin_password
}

# CF Organizations
resource "cloudfoundry_org" "org" {
  name = var.cf_org_name
}

# CF Spaces
resource "cloudfoundry_space" "org-space-dev" {
  name = "dev"
  org  = cloudfoundry_org.org.id
}

resource "cloudfoundry_space" "org-space-qas" {
  name = "qas"
  org  = cloudfoundry_org.org.id
}

# CF Spaces Users
resource "cloudfoundry_space_users" "org-space-dev-users" {
  space      = cloudfoundry_space.org-space-dev.id
  managers   = [var.admin_user]
  developers = [var.admin_user]
  auditors   = []
}

# CF Spaces Services
data "cloudfoundry_service" "alert" {
  name = "alert-notification"
}

resource "cloudfoundry_service_instance" "alert-srv" {
  name         = "alert-srv"
  space        = cloudfoundry_space.org-space-dev.id
  service_plan = data.cloudfoundry_service.alert.service_plans["free"]
  depends_on   = [cloudfoundry_space_users.org-space-dev-users]
}
