# --- root/variables.tf ---

variable "aws_region" {
  default = "us-east-1"
}

variable "access_ip" {}

# fsx variables
variable "refresh_token" {
  sensitive = true
}
variable "fsx_admin_password" {
  sensitive = true
}
variable "fsx_cloudmanager_aws_credential_name" {
  sensitive = true
}
variable "fsx_account_id" {
  sensitive = true
}
variable "fsx_workspace_id" {
  sensitive = true
}