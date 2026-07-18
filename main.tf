resource "google_cloudfunctions2_function" "this" {
  project  = var.project_id
  name     = var.name
  location = var.location
  labels   = var.labels

  build_config {
    runtime     = var.runtime
    entry_point = var.entry_point

    source {
      storage_source {
        bucket = var.source_bucket
        object = var.source_object
      }
    }
  }

  service_config {
    max_instance_count    = var.max_instance_count
    available_memory      = var.available_memory
    environment_variables = var.environment_variables
  }
}
