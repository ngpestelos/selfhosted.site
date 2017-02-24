resource "digitalocean_droplet" "worker-1" {
  image = "${var.do_image_id}"
  name = "worker-1"
  region = "sfo2"
  size = "8gb"
  ssh_keys = ["${var.do_ssh_key}"]
  user_data="${file("user_data/openshift.yml")}"
}

resource "digitalocean_record" "worker-1" {
  domain = "${var.do_domain}"
  type = "A"
  name = "worker-1"
  value = "${digitalocean_droplet.worker-1.ipv4_address}"
}

resource "digitalocean_droplet" "worker-2" {
  image = "${var.do_image_id}"
  name = "worker-2"
  region = "sfo2"
  size = "8gb"
  ssh_keys = ["${var.do_ssh_key}"]
  user_data="${file("user_data/openshift.yml")}"
}

resource "digitalocean_record" "worker-2" {
  domain = "${var.do_domain}"
  type = "A"
  name = "worker-2"
  value = "${digitalocean_droplet.worker-2.ipv4_address}"
}