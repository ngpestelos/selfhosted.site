resource "digitalocean_volume" "gluster-1" {
  region="sfo2"
  name="gluster-1"
  size="100"
  description="glusterfs volume"
}

resource "digitalocean_droplet" "gluster-1" {
  image="ubuntu-14-04-x64"
  name="gluster-1"
  region="sfo2"
  size="1gb"
  ssh_keys=["${var.do_ssh_fingerprint}"]
  volume_ids=["${digitalocean_volume.gluster-1.id}"]
  user_data="${file("user_data/gluster.yml")}"
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
  image="ubuntu-14-04-x64"
  name="gluster-2"
  region="sfo2"
  size="1gb"
  ssh_keys=["${var.do_ssh_fingerprint}"]
  volume_ids=["${digitalocean_volume.gluster-2.id}"]
  user_data="${file("user_data/gluster.yml")}"
}

resource "digitalocean_record" "gluster-2" {
  domain="${var.do_domain}"
  type="A"
  name="gluster-2"
  value="${digitalocean_droplet.gluster-2.ipv4_address}"
}
