resource "digitalocean_droplet" "master-1" {
  image="${var.do_image_id}"
  name="master-1"
  region="sfo2"
  size="4gb"
  ssh_keys=["${var.do_ssh_fingerprint}"]
}

resource "digitalocean_record" "master-1" {
  domain="${var.do_domain}"
  type="A"
  name="master-1"
  value="${digitalocean_droplet.master-1.ipv4_address}"
}
