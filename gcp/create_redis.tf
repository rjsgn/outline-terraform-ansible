/*
* Create Redis Instance
*/

resource "google_redis_instance" "outline_redis_instance" {

  name = var.db_instance_name
  tier = var.redis_tier
  location_id = var.redis_location_id
  memory_size_gb = var.redis_memory_size_gb
  redis_version = "REDIS_4_0"
  display_name = var.redis_instance_name
  authorized_network = google_compute_network.outline_network.id
  connect_mode = "PRIVATE_SERVICE_ACCESS"
  depends_on = [google_service_networking_connection.private_vpc_connection]
  count = var.enable_gcp_redis_memorystore ? 1: 0
}
