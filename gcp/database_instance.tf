/*
* Create Postgres SQL Database Instance
*/

resource "google_sql_database_instance" "outline_db_instance" {

  name = var.db_instance_name
  database_version = var.db_version
  region = var.db_region

  depends_on = [google_service_networking_connection.private_vpc_connection]

  settings {
    tier = var.db_tier
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.outline_network.id
      require_ssl = false
    }
  }
}
