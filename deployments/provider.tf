provider "google" {
  region  = var.region
  version = ">= 3"
}

terraform {
  required_version = ">= 0.12.21"
}
