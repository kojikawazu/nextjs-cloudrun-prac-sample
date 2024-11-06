# ---------------------------------------------
# Variables
# ---------------------------------------------
variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "gcp_project_id" {
  type = string
}

variable "gcp_region" {
  type = string
}

variable "http_port" {
  type = number
}

variable "invoker_member" {
  type = string
}

variable "invoker_role" {
  type = string
}

variable "service_name" {
  type = string
}

variable "repository_id" {
  type = string
}
