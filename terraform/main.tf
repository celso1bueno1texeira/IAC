terraform {
    required_version = "~>1.0"

    required_providers {
        digitalocean = {
            source = "digitalocean/digitalocean"
            version = "~> 2.0"
        }
    }
}    

provider "digitalocean" {
    token = "dop_v1_800d1499ea0dafdb6e9e8247214d16e5ee103d8006d8a2bd4828c8ad92c6e26e"
}

data "digitalocean_ssh_key" "ssh_key" {
        name = "ssh_key"
}

resource "digitalocean_droplet" "web" {
    image  = "ubuntu-18-04-x64"
    name   = "vm-ubuntu"
    region = "nyc1"
    size   = "s-1vcpu-2gb"
    ssh_keys = [data.digitalocean_ssh_key.ssh_key.id]
}

resource "digitalocean_firewall" "web" {
    name = "only-22-80-and-443"

    droplet_ids = [digitalocean_droplet.web.id]

inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
}


outbound_rule {
    protocol              = "tcp"
    port_range            = "22"
    destination_addresses = ["0.0.0.0/0", "::/0"]
}

}


