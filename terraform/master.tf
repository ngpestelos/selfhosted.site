resource "digitalocean_volume" "master-volume-1" {
  region = "sfo2"
  name = "master-volume-1"
  size = "20"
}

resource "digitalocean_droplet" "master" {
  image = "${var.do_image_id}"
  name = "master"
  region = "sfo2"
  size = "8gb"
  ssh_keys = ["${var.do_ssh_key}"]
  user_data ="${file("user_data/openshift.yml")}"
  volume_ids = ["${digitalocean_volume.master-volume-1.id}"]
}

resource "digitalocean_record" "master" {
  domain = "${var.do_domain}"
  type = "A"
  name = "master"
  value = "${digitalocean_droplet.master.ipv4_address}"
}

resource "digitalocean_record" "wildcard" {
  domain = "${var.do_domain}"
  type = "A"
  name = "*"
  value = "${digitalocean_droplet.master.ipv4_address}"
}

resource "digitalocean_record" "apex" {
  domain = "${var.do_domain}"
  type = "A"
  name = "@"
  value = "${digitalocean_droplet.master.ipv4_address}"
}