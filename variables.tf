variable "project_id" {
  description = "ID of the project in which to create the function."
  type        = string
}

variable "name" {
  description = "Name of the Cloud Function."
  type        = string
}

variable "location" {
  description = "Region in which to deploy the function."
  type        = string
}

variable "runtime" {
  description = "Runtime to run the function, e.g. nodejs20, python312 or go122."
  type        = string
  default     = "nodejs20"
}

variable "entry_point" {
  description = "Name of the function (as defined in source code) that is executed."
  type        = string
}

variable "source_bucket" {
  description = "Name of the Cloud Storage bucket holding the source archive."
  type        = string
}

variable "source_object" {
  description = "Object path of the source archive within the bucket."
  type        = string
}

variable "available_memory" {
  description = "Memory available to the function, e.g. \"256M\"."
  type        = string
  default     = "256M"
}

variable "max_instance_count" {
  description = "Maximum number of function instances."
  type        = number
  default     = 100

  validation {
    condition     = var.max_instance_count >= 1
    error_message = "max_instance_count must be at least 1."
  }
}

variable "environment_variables" {
  description = "Environment variables passed to the function at runtime."
  type        = map(string)
  default     = {}
}

variable "labels" {
  description = "Labels applied to the function."
  type        = map(string)
  default     = {}
}
