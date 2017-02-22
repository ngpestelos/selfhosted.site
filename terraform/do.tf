variable "do_token" {}
variable "do_ssh_key" {}
variable "do_image_id" { default="centos-7-x64" }
variable "do_domain" { default="selfhosted.site" }

provider "digitalocean" {
  token = "${var.do_token}"
}
