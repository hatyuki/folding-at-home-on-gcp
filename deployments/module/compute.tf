data "google_compute_image" "default" {
  project = "ubuntu-os-cloud"
  family  = "ubuntu-1804-lts"
}

resource "google_compute_instance_template" "default" {
  name_prefix             = "${var.name}-"
  machine_type            = var.machine_type
  metadata_startup_script = templatefile("${path.module}/template/startup.tpl.bash", local.fahconfig)

  disk {
    source_image = data.google_compute_image.default.name
    disk_type    = var.disk_type
    disk_size_gb = var.disk_size_gb
    auto_delete  = true
    boot         = true
  }

  scheduling {
    preemptible         = var.preemptible
    on_host_maintenance = local.compute_instance_template.scheduling.on_host_maintenance
    automatic_restart   = local.compute_instance_template.scheduling.automatic_restart
  }

  shielded_instance_config {
    enable_secure_boot          = false
    enable_vtpm                 = false
    enable_integrity_monitoring = false
  }

  network_interface {
    network = var.network

    access_config {
      network_tier = var.network_tier
    }
  }
}

resource "google_compute_region_instance_group_manager" "default" {
  name               = var.name
  base_instance_name = var.name
  region             = var.region
  target_size        = var.desire_count

  version {
    instance_template = google_compute_instance_template.default.self_link
  }

  lifecycle {
    create_before_destroy = true
  }
}
