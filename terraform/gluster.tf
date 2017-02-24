resource "digitalocean_volume" "gluster-1" {
  region="sfo2"
  name="gluster-1"
  size="100"
  description="glusterfs volume"
}

resource "digitalocean_droplet" "gluster-1" {
  image="${var.do_image_id}"
  name="gluster-1"
  region="sfo2"
  size="1gb"
  ssh_keys=["${var.do_ssh_key}"]
  volume_ids=["${digitalocean_volume.gluster-1.id}"]
  user_data="${file("user_data/openshift.yml")}"
}

resource "digitalocean_record" "gluster-1" {
  domain="${var.do_domain}"
  type="A"
  name="gluster-1"
  value="${digitalocean_droplet.gluster-1.ipv4_address}"
}

resource "digitalocean_volume" "gluster-2" {
  region="sfo2"
  name="gluster-2"
  size="100"
  description="glusterfs volume"
}

resource "digitalocean_droplet" "gluster-2" {
  image="${var.do_image_id}"
  name="gluster-2"
  region="sfo2"
  size="1gb"
  ssh_keys=["${var.do_ssh_key}"]
  volume_ids=["${digitalocean_volume.gluster-2.id}"]
  user_data="${file("user_data/openshift.yml")}"
}

resource "digitalocean_record" "gluster-2" {
  domain="${var.do_domain}"
  type="A"
  name="gluster-2"
  value="${digitalocean_droplet.gluster-2.ipv4_address}"
}

resource "digitalocean_volume" "gluster-3" {
  region="sfo2"
  name="gluster-3"
  size="100"
  description="glusterfs volume"
}

resource "digitalocean_droplet" "gluster-3" {
  image="${var.do_image_id}"
  name="gluster-3"
  region="sfo2"
  size="1gb"
  ssh_keys=["${var.do_ssh_key}"]
  volume_ids=["${digitalocean_volume.gluster-3.id}"]
  user_data="${file("user_data/openshift.yml")}"
}

resource "digitalocean_record" "gluster-3" {
  domain="${var.do_domain}"
  type="A"
  name="gluster-3"
  value="${digitalocean_droplet.gluster-3.ipv4_address}"
}