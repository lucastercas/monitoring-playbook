resource "digitalocean_droplet" "loadbalancer" {
  count              = 0
  name               = "loadbalancer-${count.index}"
  image              = var.droplets_image
  size               = "s-2vcpu-2gb"
  region             = var.region
  private_networking = true
  ssh_keys = [
    digitalocean_ssh_key.default.fingerprint
  ]
}

resource "digitalocean_droplet" "master" {
  count              = 1
  name               = "master-${count.index}"
  image              = var.droplets_image
  size               = "s-2vcpu-4gb"
  region             = var.region
  private_networking = true
  ssh_keys = [
    digitalocean_ssh_key.default.fingerprint
  ]
}

resource "digitalocean_droplet" "worker" {
  count              = 1
  name               = "worker-${count.index}"
  image              = var.droplets_image
  size               = "s-2vcpu-4gb"
  region             = var.region
  private_networking = true
  ssh_keys = [
    digitalocean_ssh_key.default.fingerprint
  ]
}

resource "digitalocean_droplet" "nfs" {
  count = 1
  name   = "nfs-${count.index}"
  image  = var.droplets_image
  size   = "s-1vcpu-1gb"
  region = var.region
  private_networking = true
  ssh_keys = [
    digitalocean_ssh_key.default.fingerprint
  ]
}
