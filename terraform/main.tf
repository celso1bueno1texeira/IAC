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
    token = "dop_v1_0fe7f1291653c6770f4cdb5d363b75927c67cd7dc63a34ee9f26b49a4da18719"
}

resource "digitalocean_droplet" "vm_ubuntu" {
    image = "ubuntu-22-04-x64"
    name = "vm-ubuntu"
    region = "nyc1"
    size = "s-1vcpu-2gb"
    
}

