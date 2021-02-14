// Google Cloud Platform Project Settings

variable "project_id" {
  type        = string
  description = "GCP Project ID"
  default     = "project-id"
}

variable "region" {
  type        = string
  description = "GCP Project Region"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "GCP Project Zone"
  default     = "us-central1-c"
}

// Google Cloud Platform Credentials

variable "credentials_file" {
  type        = string
  description = "Absolute path of the GCP Service Account Key JSON File"
  default     = "/path/to/credentials_file.json"
}

// Outline Server Settings

variable "outline_server_region" {
  type        = string
  description = "Compute Engine VM Instance Region"
  default     = "us-central1"
}

variable "outline_server_zone" {
  type        = string
  description = "Compute Engine VM Instance Zone"
  default     = "us-central1-c"
}

variable "outline_server_machine_type" {
  type        = string
  description = "Compute Engine VM Instance Machine Type"
  default     = "e2-small"
}

variable "outline_server_name" {
  type        = string
  description = "Compute Engine VM Instance Name"
  default     = "outline-instance"
}

variable "outline_server_boot_disk_image" {
  type        = string
  description = "Compute Engine VM Instance Boot Disc Image"
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "outline_server_boot_disk_size" {
  type        = number
  description = "Compute Engine VM Instance Boot Disc Size"
  default     = 10
}

variable "outline_server_boot_disk_type" {
  type        = string
  description = "Compute Engine VM Instance Boot Disc Type. Available options are pd-standard, pd-balanced and pd-ssd"
  default     = "pd-ssd"
}

// User Credentials for Target Machine

variable "user" {
  type        = string
  description = "Username for the SSH Key."
  default     = "user"
}

variable "public_key" {
  type        = string
  description = "Absolute path to the SSH public key. Use ssh-keygen to generate a new SSH key. This public key will be added to the authorized keys for the VM Instance."
  default     = "/path/to/public_key.pub"
}

variable "private_key" {
  type        = string
  description = "Absolute path to the SSH private key. This private key will be used for SSH authentication."
  default     = "/path/to/private_key"
}

// Database Instance Settings

variable "db_instance_name" {
  type        = string
  description = "Database Instance Name"
  default     = "outline-db-instance"
}

variable "db_version" {
  type        = string
  description = "Database version"
  default     = "POSTGRES_12"
}

variable "db_region" {
  type        = string
  description = "SQL Instance Region"
  default     = "us-central1"
}

variable "db_tier" {
  type        = string
  description = "SQL Instance Tier"
  default     = "db-f1-micro"
}

// Database Details

variable "db_name" {
  type        = string
  description = "Database Name"
  default     = "outline_db"
}

variable "db_user" {
  type        = string
  description = "Database Username"
  default     = "outline_db_user"
}

variable "db_password" {
  type        = string
  description = "Database Password"
  default     = "Passw0rd"
}

// Redis Settings

variable "enable_gcp_redis_memorystore" {
  type = bool
  description = "True to enable GCP Redis Memorystore instead"
  default = false
}

variable "redis_instance_name" {
  type = string
  description = "Redis Instance Name"
  default = "redis_outline_instance"
}

variable "redis_tier" {
  type = string
  description = "Redis Tier"
  default = "STANDARD_HA"
}

variable "redis_location_id" {
  type = string
  description = "Redis Location ID"
  default = "us-central1-a"
}

variable "redis_memory_size_gb" {
  type = number
  description = "Redis Memory Size"
  default = 1
}
