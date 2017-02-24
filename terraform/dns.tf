# worker-0 is where the router will be scheduled
resource "digitalocean_record" "wildcard" {
  domain="${var.do_domain}"
  type="A"
  name="*"
  value="${digitalocean_droplet.worker-1.ipv4_address}"
}

resource "digitalocean_record" "apex" {
  domain="${var.do_domain}"
  type="A"
  name="@"
  value="${digitalocean_droplet.worker-1.ipv4_address}"
}