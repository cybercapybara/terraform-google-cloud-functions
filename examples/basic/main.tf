terraform {
  required_version = ">= 1.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "source" {
  project                     = var.project_id
  name                        = "${var.project_id}-fn-source"
  location                    = var.region
  uniform_bucket_level_access = true
}

module "function" {
  source = "../.."

  project_id    = var.project_id
  name          = "example-function"
  location      = var.region
  runtime       = "nodejs20"
  entry_point   = "helloWorld"
  source_bucket = google_storage_bucket.source.name
  source_object = "function-source.zip"
}

variable "project_id" {
  description = "Project ID to deploy the example function into."
  type        = string
}

variable "region" {
  description = "Region for the google provider and function."
  type        = string
  default     = "us-central1"
}

output "function_uri" {
  value = module.function.uri
}
