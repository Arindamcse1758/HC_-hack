
module "gcp-network" {
  source = "../../vpc-modules/module"
  version = "~> 7.0"

  project_id   = var.project_id
  network_name = var.network_name
  subnets = [
    for subnet_name, subnet in var.subnet_ips :
    {
      subnet_name           = subnet_name
      subnet_ip             = subnet.ip_cidr_range
      subnet_region         = subnet.region
      subnet_private_access = true
    }
  ]
  secondary_ranges = {
    (var.network_name) = [
      {
        range_name    = var.gke_ip_range_pods
        ip_cidr_range = "10.100.0.0/16"       # Per environment subnet, match tfvars!
      },
      {
        range_name    = var.gke_ip_range_services
        ip_cidr_range = "10.200.0.0/20"       # Per environment subnet, match tfvars!
      },
    ]
  }
}