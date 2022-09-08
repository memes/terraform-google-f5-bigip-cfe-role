variable "target_type" {
  type    = string
  default = "project"
}

variable "target_id" {
  type = string
}

variable "id" {
  type    = string
  default = null
}

variable "title" {
  type    = string
  default = "Custom F5 BIG-IP CFE role"
}

variable "members" {
  type    = list(string)
  default = []
}

variable "random_id_prefix" {
  type    = string
  default = "bigip_cfe"
}
