selfhosted.site
===============

Proof-of-concept OpenShift Origin cluster on DigitalOcean.

TODO Cluster Diagram

### DigitalOcean

You must have a DigitalOcean account for provisioning droplets. In addition, you will need a SSH public key added to your account as well an API token.

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

Exit the SSH connection.

Shell into gluster-2:

`ssh root@gluster-2.selfhosted.site`

Probe for the first gluster node:

`

### OpenShift

Clone [openshift-ansible](https://github.com/openshift/openshift-ansible).

Customize `hosts.example` found in this project and place it inside `openshift-ansible`.

Run the playbook:

```
ansible-playbook -i hosts playbooks/byo/config.yml -vvvv
```

The `-vvvv` switch enables very vebose output from Ansible.
