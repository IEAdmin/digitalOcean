terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
provider "digitalocean" {
  token = var.do_token
}

# module "droplet" {
#   source                   = "./modules/digitalOcean/droplet"
#   dropletName              = var.dropletName
#   dropletImage             = var.dropletImage
#   dropletRegion            = var.dropletRegion
#   dropletSize              = var.dropletSize
#   dropletInlineProvisioner = var.dropletInlineProvisioner
#   sshKeyName               = var.sshKeyName
#   sshKeyPath               = var.sshKeyPath
#   htmlSourceLocation       = var.htmlSourceLocation
#   htmlDestinationLocation  = var.htmlDestinationLocation
#   privateKeyPath           = var.privateKeyPath
#   dropletUserName          = var.dropletUserName
# }

resource "digitalocean_droplet" "dropletVM" {
  depends_on = [
    digitalocean_ssh_key.ssh_key
  ]
  image  = var.dropletImage
  name   = var.dropletName
  region = var.dropletRegion
  size   = var.dropletSize
  ssh_keys = [
    digitalocean_ssh_key.ssh_key.id
  ]

  connection {
    host        = self.ipv4_address
    user        = var.dropletUserName
    type        = "ssh"
    private_key = file(var.privateKeyPath)
    timeout     = "2m"
  }

  provisioner "remote-exec" {
    inline = var.dropletInlineProvisioner
  }
  provisioner "file" {
    source      = var.htmlSourceLocation
    destination = var.htmlDestinationLocation
  }
}

resource "digitalocean_reserved_ip" "example" {
  droplet_id = digitalocean_droplet.dropletVM.id
  region     = digitalocean_droplet.dropletVM.region
}
resource "digitalocean_ssh_key" "ssh_key" {
  name       = var.sshKeyName
  public_key = file(var.sshKeyPath)
}
