variable "key_location" {}

resource "digitalocean_ssh_key" "redteam" {
  name       = "Redteam"
  public_key = "${file(var.key_location)}"
}
