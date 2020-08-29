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

resource "digitalocean_volume" "nfs_volume" {
  region                  = "nyc1"
  name                    = "baz"
  size                    = 25
  initial_filesystem_type = "ext4"
  description             = "an example volume"
}

resource "digitalocean_droplet" "nfs" {
  name   = "nfs"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-18-04-x64"
  region = "nyc1"
}

resource "digitalocean_volume_attachment" "nfs" {
  droplet_id = digitalocean_droplet.nfs.id
  volume_id  = digitalocean_volume.nfs_volume.id
}
