module "default" {
  source       = "./module"
  region       = var.region
  machine_type = var.machine_type
  fahconfig    = var.fahconfig
}