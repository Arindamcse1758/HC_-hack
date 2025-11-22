project_id         = "my-gcp-project-dev"
env                = "dev"
region             = "asia-south1"
secondary_region   = "asia-south2"

network_name = "dev-shared-vpc"

subnet_ips = {
  dev-primary = {
    ip_cidr_range = "10.10.0.0/20"
    region        = "asia-south1"
  }
  dev-secondary = {
    ip_cidr_range = "10.20.0.0/20"
    region        = "asia-south2"
  }
}



gcs_state_bucket = "tf-state-shared"
gcs_state_prefix = "gke/dev"

service_account_email = "gke-dev-sa@my-gcp-project-dev.iam.gserviceaccount.com"

tags = {
  environment = "dev"
  team        = "platform"
  app         = "healthcare-hackathon"
}
