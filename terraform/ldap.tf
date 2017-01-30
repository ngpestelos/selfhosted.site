resource "digitalocean_droplet" "ldap" {
  image="ubuntu-14-04-x64"
  name="ldap"
  region="sfo2"
  size="1gb"
  ssh_keys=["${var.do_ssh_fingerprint}"]
}

resource "digitalocean_record" "ldap" {
  domain="${var.do_domain}"
  type="A"
  name="ldap"
  value="${digitalocean_droplet.ldap.ipv4_address}"
}
