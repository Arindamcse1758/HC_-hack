variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "env" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "region" {
  description = "Primary region for regional resources"
  type        = string
}

variable "secondary_region" {
  description = "Secondary region for high availability networking"
  type        = string
}

variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "subnet_ips" {
  description = "Map of subnets and CIDRs per region"
  type = map(object({
    ip_cidr_range = string
    region        = string
  }))
}



variable "gcs_state_bucket" {
  description = "Existing GCS bucket name used for Terraform state"
  type        = string
}

variable "gcs_state_prefix" {
  description = "Prefix (folder) in GCS bucket for Terraform state files"
  type        = string
}

variable "tags" {
  description = "Common resource labels"
  type        = map(string)
  default     = {}
}

variable "service_account_email" {
  description = "GKE node service account email"
  type        = string
}

variable "enable_cloud_logging" {
  description = "Enable Cloud Logging for GKE"
  type        = bool
  default     = true
}

variable "enable_cloud_monitoring" {
  description = "Enable Cloud Monitoring for GKE"
  type        = bool
  default     = true
}
