/*
* Create Compute Engine VM Instance with Outline server installed
*/

resource "google_compute_instance" "outline_vm" {

  name = var.outline_server_name
  machine_type = var.outline_server_machine_type

  boot_disk {
    initialize_params {
      image = var.outline_server_boot_disk_image
      size = var.outline_server_boot_disk_size
      type = var.outline_server_boot_disk_type
    }
  }

  network_interface {
    network = google_compute_network.outline_network.name
    access_config {
    }
  }

  metadata = {
    ssh-keys = "${var.user}:${file(var.public_key)}"
  }

  connection {
    user = var.user
    host = self.network_interface.0.access_config.0.nat_ip
    private_key = file(var.private_key)
  }

  provisioner "remote-exec" {
    script = "scripts/wait_for_instance.sh"
  }

  provisioner "local-exec" {
    command = "ansible-playbook ../ansible/main.yml -i '${self.network_interface.0.access_config.0.nat_ip},' -e='${jsonencode({
      ansible_python_interpreter = "/usr/bin/python3"
      db_password = var.db_password
      db_username = var.db_user
      db_ip_address = google_sql_database_instance.outline_db_instance.ip_address.0.ip_address
      db_name = var.db_name
      server_ip = self.network_interface.0.access_config.0.nat_ip
      redis_host = var.enable_gcp_redis_memorystore ? google_redis_instance.outline_redis_instance[0].host : null
      redis_port = var.enable_gcp_redis_memorystore ? google_redis_instance.outline_redis_instance[0].port : null
      enable_redis = var.enable_gcp_redis_memorystore ? false : true
    })}' -u=${var.user} --private-key=${var.private_key} --ssh-common-args='-o StrictHostKeyChecking=no'"
  }

}
