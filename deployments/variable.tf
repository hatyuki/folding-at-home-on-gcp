variable "region" {
  type    = string
  default = "asia-east1"
}

variable "machine_type" {
  type    = string
  default = "e2-standard-2"
}

variable "fahconfig" {
  type = map(string)

  default = {
    username = "Anonymouse"
    team     = 0
    passkey  = ""
    power    = "medium"
  }
}
