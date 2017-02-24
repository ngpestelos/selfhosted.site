resource "digitalocean_droplet" "etcd-1" {
  image = "${var.do_image_id}"
  name = "etcd-1"
  region = "sfo2"
  size = "512mb"
  ssh_keys = ["${var.do_ssh_key}"]
}

resource "digitalocean_record" "etcd-1" {
  domain = "${var.do_domain}"
  type = "A"
  name = "etcd-1"
  value = "${digitalocean_droplet.etcd-1.ipv4_address}"
}

resource "digitalocean_droplet" "etcd-2" {
  image = "${var.do_image_id}"
  name = "etcd-2"
  region = "sfo2"
  size = "512mb"
  ssh_keys = ["${var.do_ssh_key}"]
}

resource "digitalocean_record" "etcd-2" {
  domain = "${var.do_domain}"
  type = "A"
  name = "etcd-2"
  value = "${digitalocean_droplet.etcd-2.ipv4_address}"
}

resource "digitalocean_droplet" "etcd-3" {
  image = "${var.do_image_id}"
  name = "etcd-3"
  region = "sfo2"
  size = "512mb"
  ssh_keys = ["${var.do_ssh_key}"]
}

resource "digitalocean_record" "etcd-3" {
  domain = "${var.do_domain}"
  type = "A"
  name = "etcd-3"
  value = "${digitalocean_droplet.etcd-3.ipv4_address}"
}