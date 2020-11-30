/*
* Deploy to Google Cloud Platform
*/

terraform {

  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }

}

provider "google" {

  version     = "3.5.0"
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = var.region
  zone        = var.zone

}
