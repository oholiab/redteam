variable "do_token" {}

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "red01" {
  image = "ubuntu-18-04-x64"
  name = "red01"
  region = "lon1"
  size = "s-1vcpu-1gb"
  ssh_keys = ["${digitalocean_ssh_key.redteam.fingerprint}"]
}
