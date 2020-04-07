variable "name" {
  type    = string
  default = "folding-at-home"
}

variable "region" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "e2-standard-2"
}

variable "disk_type" {
  type    = string
  default = "pd-standard"
}

variable "disk_size_gb" {
  type    = number
  default = 10
}

variable "preemptible" {
  type    = bool
  default = true
}

variable "network" {
  type    = string
  default = "default"
}

variable "network_tier" {
  type    = string
  default = "STANDARD"
}

variable "desire_count" {
  type    = number
  default = 1
}

variable fahconfig {
  type = map(string)

  default = { /*
    username = "Anonymouse"
    team     = 0
    passkey  = ""
    power    = "medium" // light, medium or full
  */ }
}
