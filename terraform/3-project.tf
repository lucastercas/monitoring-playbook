resource "digitalocean_project" "monitoring" {
  name        = "monitoring_services"
  description = "Monitoring Services"
  purpose     = "Project that hosts monitoring services"
  environment = "Development"
}

resource "digitalocean_project_resources" "droplets" {
  project   = digitalocean_project.monitoring.id
  resources = concat(
    digitalocean_droplet.master.*.urn,
    digitalocean_droplet.worker.*.urn,
    digitalocean_droplet.nfs.*.urn,
  )
}

resource "digitalocean_project_resources" "domains" {
  project = digitalocean_project.monitoring.id
  resources = [
    digitalocean_domain.default.urn
  ]
}
