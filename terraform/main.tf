# ---------------------------------------------
# Terraform configuration
# ---------------------------------------------
terraform {
  required_version = ">=1.6"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

# ---------------------------------------------
# Provider
# ---------------------------------------------
provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}
