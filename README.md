selfhosted.site
===============

This is a tutorial on how to setup an [Openshift Origin](https://github.com/openshift/origin) cluster on [DigitalOcean](https://digitalocean.com). It is intended for those who are familiar 
with Docker and Kubernetes and would like to bring up an OpenShift cluster from scratch.

The goal is to setup a hypothetical platform-as-a-service for self-hosted apps, with a running continuous deployment pipeline (GitLab).

TODO Cluster Diagram

### Assumptions

This tutorial is built using OS X 10.12.3 (with Homebrew as package manager).

You will need to install these tools:

* ansible v2.2.0.0
* terraform v0.8.5
* oc v1.3.2

You will also need a DigitalOcean account (token and a SSH fingerprint).

### Chapters

* [Provision Droplets](doc/01-provision-droplets.md)
* [Setup LDAP]
* [Setup GlusterFS]
* [Setup OpenShift]
* [Deploy GitLab on OpenShift]
* [Setup Continuous Deployment Pipeline]

### Terraform

Generate execution plan:

```
terraform plan -out plan.tfplan \
  --var "do_token=<YOUR_DO_TOKEN>" \
  --var "do_ssh_fingerprint=<YOUR_SSH_FINGERPRINT>"
```

Apply execution plan:

```
terraform apply plan.tfplan
```

### Ansible

Download dependencies:

```
cd ansible
ansible-galaxy install -r requirements.yml
```

### LDAP

Copy from template:

`cp hosts.example hosts`

Copy `ca.pem`, `cert.pem`, and `key.pem` to `ansible/files`.

Run the playbook:

```
ansible-playbook -i hosts ldap.yml -vvvv
```

SSH into ldap:

`ssh root@ldap.selfhosted.site`

Run manual steps to setup LDAP (see Ansible stdout):

Add organizational unit (Users). Within Users, add 

Add users via phpldapadmin (go to `https://ldap.selfhosted.site/phpldapadmin`).


### GlusterFS

Shell into gluster-1:

`ssh root@gluster-1.selfhosted.site`

Probe for second gluster node:

`gluster peer probe gluster-2.selfhosted.site`

Initialize `/mnt/gluster-1`:

```
sudo mkfs.ext4 -F /dev/disk/by-id/scsi-0DO_Volume_gluster-1
```

Mount `/mnt/gluster-1`:

```
sudo mkdir -p /mnt/gluster-1; sudo mount -o discard,defaults /dev/disk/by-id/scsi-0DO_Volume_gluster-1 /mnt/gluster-1; echo /dev/disk/by-id/scsi-0DO_Volume_gluster-1 /mnt/gluster-1 ext4 defaults,nofail,discard 0 0 | sudo tee -a /etc/fstab
```

`/mnt/gluster-1` should be mounted.

Exit the SSH connection.

Shell into gluster-2:

`ssh root@gluster-2.selfhosted.site`

Probe for the first gluster node:

`gluster peer probe gluster-1.selfhosted.site`

Initialize: `/mnt/gluster-2`:

```
sudo mkfs.ext4 -F /dev/disk/by-id/scsi-0DO_Volume_gluster-2
```

Mount `/mnt/gluster-2`:

```
sudo mkdir -p /mnt/gluster-2; sudo mount -o discard,defaults /dev/disk/by-id/scsi-0DO_Volume_gluster-2 /mnt/gluster-2; echo /dev/disk/by-id/scsi-0DO_Volume_gluster-2 /mnt/gluster-2 ext4 defaults,nofail,discard 0 0 | sudo tee -a /etc/fstab
```

### OpenShift

Test if SSH login works for the following hosts (need to login as root at least once):

* `master-1.selfhosted.site`
* `worker-1.selfhosted.site`
* `worker-2.selfhosted.site`
* `etcd-1.selfhosted.site`
* `etcd-2.selfhosted.site`
* `etcd-3.selfhosted.site`

Clone [openshift-ansible](https://github.com/openshift/openshift-ansible).

Customize `hosts.example` found in this project and place it inside `../openshift-ansible`.

Run the playbook:

```
ansible-playbook -i hosts playbooks/byo/config.yml -vvvv
```

This will take about an hour.

The `-vvvv` switch enables very verbose output from Ansible.

After the run finishes, visit `https://master-1.selfhosted.site:8443` and login as `system:admin`.

### GitLab

Prepare persistent volumes.

Create new project (GitLab).

Import idea-to-production template.

Troubleshoot errors:

- file permissions
- allow pods to run as root

Fix routes:

- enable SSL

Visit `https://gitlab.selfhosted.site`.
