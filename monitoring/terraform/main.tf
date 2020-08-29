provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "default" {
  name       = "Hyperion SSH Key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "digitalocean_domain" "default" {
  name       = var.domain_name
  ip_address = digitalocean_droplet.master[0].ipv4_address
}

resource "digitalocean_record" "static" {
  domain = digitalocean_domain.default.name
  type   = "A"
  name   = "static"
  value  = digitalocean_droplet.master[0].ipv4_address
}

resource "digitalocean_record" "CNAME-www" {
  domain = digitalocean_domain.default.name
  type   = "CNAME"
  name   = "www"
  value  = "@"
}

resource "digitalocean_record" "www" {
  domain = digitalocean_domain.default.name
  type   = "A"
  name   = "*"
  value = digitalocean_droplet.master[0].ipv4_address
}
