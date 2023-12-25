/*
* Create Compute Firewall
*/

resource "google_compute_firewall" "outline_firewall" {
  
  name    = "web-firewall"
  network = google_compute_network.outline_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]

}
