provider "google" {
  credentials = file("mycred.json")
  project     = "My First Project"
  region      = "us-central1"  # Set your desired GCP region
}

resource "google_compute_instance" "example" {
  name         = "example-instance"
  machine_type = "e2-micro"  # Set your desired machine type
  zone         = "us-central1-a"  # Set your desired GCP zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"  # Set your desired OS image
    }
  }

  network_interface {
    network = "default"
  }
}