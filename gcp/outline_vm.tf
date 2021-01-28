/*
* Create Compute Engine VM Instance with Outline server installed
*/

resource "google_compute_instance" "outline_vm" {

  name         = var.outline_server_name
  machine_type = var.outline_server_machine_type

  boot_disk {
    initialize_params {
      image = var.outline_server_boot_disk_image
      size  = var.outline_server_boot_disk_size
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

  provisioner "ansible" {
    plays {
      playbook {
        file_path = "../ansible/main.yml"
        tags = ["common", "node", "redis", "outline", "nginx"]
      }
      enabled = true
      hosts = [self.network_interface.0.access_config.0.nat_ip]
      verbose = true
      extra_vars = {
        db_username = var.db_user
        db_password = var.db_password
        db_ip_address = google_sql_database_instance.outline_db_instance.ip_address.0.ip_address
        db_name = var.db_name
      }
    }
    ansible_ssh_settings {
      connect_timeout_seconds = 10
      connection_attempts = 10
      ssh_keyscan_timeout = 60
      insecure_no_strict_host_key_checking = false
      insecure_bastion_no_strict_host_key_checking = false
    }
  }

}
