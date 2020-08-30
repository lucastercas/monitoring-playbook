output "masters_info" {
  value = "${formatlist(
    "%s => %s - %s",
    (digitalocean_droplet.master.*.name),
    (digitalocean_droplet.master.*.ipv4_address),
    (digitalocean_droplet.master.*.ipv4_address_private),
  )}"
}

output "workers_info" {
  value = "${formatlist(
    "%s => %s - %s",
    (digitalocean_droplet.worker.*.name),
    (digitalocean_droplet.worker.*.ipv4_address),
    (digitalocean_droplet.worker.*.ipv4_address_private),
  )}"
}

output "nfs_info" {
  value = "${formatlist(
    "%s => %s - %s",
    (digitalocean_droplet.nfs.*.name),
    (digitalocean_droplet.nfs.*.ipv4_address),
    (digitalocean_droplet.nfs.*.ipv4_address_private),
  )}"
}
