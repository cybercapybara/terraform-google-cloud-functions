output "id" {
  description = "Identifier of the Cloud Function."
  value       = google_cloudfunctions2_function.this.id
}

output "name" {
  description = "Name of the Cloud Function."
  value       = google_cloudfunctions2_function.this.name
}

output "uri" {
  description = "URI of the underlying Cloud Run service that serves the function."
  value       = google_cloudfunctions2_function.this.service_config[0].uri
}
