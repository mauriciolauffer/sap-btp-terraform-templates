variable "admin_user" {}
variable "admin_password" {}
variable "global_account_subdomain" {}
variable "subaccount_region" {}
variable "subaccount_subdomain" {}
variable "subaccount_name" {}
variable "subaccount_id" {}

resource "null_resource" "btp_subaccount_creation" {
  provisioner "local-exec" {
    command = "btp login --url https://cpcli.cf.eu10.hana.ondemand.com --user ${var.admin_user} --password ${var.admin_password}"
  }

  provisioner "local-exec" {
    command = "btp target --global-account ${var.global_account_subdomain}"
  }

  provisioner "local-exec" {
    command = "btp create accounts/subaccount --display-name ${var.subaccount_name} --region ${var.subaccount_region} --subdomain ${var.subaccount_subdomain}"
  }
}
