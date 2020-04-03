locals {
  compute_instance_template = {
    scheduling = {
      on_host_maintenance = var.preemptible ? "TERMINATE" : "MIGRATE"
      automatic_restart   = ! var.preemptible
    }
  }

  fahconfig = merge({
    username   = "Anonymouse"
    team       = 0
    power      = "medium"
  }, var.fahconfig)
}