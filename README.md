selfhosted.site
===============

This is a tutorial on how to setup an [Openshift Origin](https://github.com/openshift/origin) cluster on [DigitalOcean](https://digitalocean.com). It is intended for those who are familiar
with Docker and Kubernetes and would like to bring up an OpenShift cluster from scratch.

### Assumptions

#### Operating System

* OS X 10.12.3

#### Accounts

* DigitalOcean

#### Tools

* Homebrew 1.1.10
* terraform 0.8.7
* ansible 2.2.0.0

#### Certificates

* certs/cert.pem
* certs/key.pem
* certs/ca.pem

I use a wildcard certificate (not included).

### Tasks

* [Prepare DigitalOcean](digitalocean/README.md)
* [Provision droplets](terraform/provision.md)
* [Install OpenShift](openshift/README.md)
