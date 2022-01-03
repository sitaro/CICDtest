variable "mathops_vpc_cidr" {
  type    = string
  default = "192.168.8.0/22"
}

variable "mathops_public_cidr" {
  type    = string
  default = "192.168.8.0/24"
}

variable "prefix" {
  default = "mathops-test"
}

variable "project" {
  default = "mathops test"
}

variable "contact" {
  default = "mpaezolt@gmail.com"
}
