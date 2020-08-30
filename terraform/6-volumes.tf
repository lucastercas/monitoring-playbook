resource "digitalocean_volume" "nfs_volume" {
  region                  = var.region
  name                    = "nfsvolume"
  size                    = 25
  initial_filesystem_type = "ext4"
  description             = "Volume for the NFS droplet"
}

resource "digitalocean_volume_attachment" "nfs" {
  droplet_id = digitalocean_droplet.nfs[0].id
  volume_id  = digitalocean_volume.nfs_volume.id
}
