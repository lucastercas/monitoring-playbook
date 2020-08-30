variable "do_token" {
  type        = string
  description = "Digital Ocean API Token"
}

variable "domain_name" {
  type        = string
  description = "Domain Name to create the DNSs"
  default = "lucastercas.xyz"
}

variable "region" {
  type        = string
  description = "Region to create the droplets"
  default     = "nyc3"
}

variable "droplets_image" {
  type        = string
  description = "Default OS version for the droplets"
  default     = "debian-10-x64"
}

variable "ssh_key_name" {
  type    = string
  default = "SSH Key"
}
