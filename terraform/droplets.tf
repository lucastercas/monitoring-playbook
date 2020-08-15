resource "digitalocean_droplet" "loadbalancer" {
  count              = 0
  name               = "loadbalancer-${count.index}"
  image              = "debian-10-x64"
  size               = "s-2vcpu-2gb"
  region             = "nyc3"
  private_networking = true
  ssh_keys = [
    digitalocean_ssh_key.default.fingerprint
  ]
}

resource "digitalocean_droplet" "master" {
  count              = 1
  name               = "master-${count.index}"
  image              = "debian-10-x64"
  size               = "s-2vcpu-4gb"
  region             = "nyc3"
  private_networking = true
  ssh_keys = [
    digitalocean_ssh_key.default.fingerprint
  ]
}

resource "digitalocean_droplet" "worker" {
  count              = 1
  name               = "worker-${count.index}"
  image              = "debian-10-x64"
  size               = "s-2vcpu-4gb"
  region             = "nyc3"
  private_networking = true
  ssh_keys = [
    digitalocean_ssh_key.default.fingerprint
  ]
}
