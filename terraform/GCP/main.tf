terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.72.0"
    }
  }
}

provider "google" {
  credentials = file("/root/.gcp/vernal-store-xxxx-xxxxxxxx.json")

  project = "vernal-store-xxxxx"
  region  = "asia-northeast2"
  zone    = "asia-northeast2-a"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}