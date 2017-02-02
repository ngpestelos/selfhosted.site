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

Run the playbook:

```
ansible-playbook -i hosts ldap.yml -vvvv
```

Run manual steps.

Add users via phpldapadmin.

### OpenShift

Clone [openshift-ansible](https://github.com/openshift/openshift-ansible).

Customize `hosts.example` found in this project and place it inside `openshift-ansible`.

Run the playbook:

```
ansible-playbook -i hosts playbooks/byo/config.yml -vvvv
```

The `-vvvv` switch enables very vebose output from Ansible.
