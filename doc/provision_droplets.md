Provision Droplets
==================

[Terraform](https://terraform.io) is used to provision droplets. Terraform communicates with the DigitalOcean API to provision resources. Its output
is a state file (*.tfstate) used to track which resources are assigned to the cluster.

### Requirements

- DigitalOcean account
- terraform (use `brew install terraform`)

### Generate execution plan

```bash
$ cd terraform
$ terraform plan -out plan.tfplan -var "do_ssh_key=$DO_SSH_KEY" -var "do_token=$DO_TOKEN"
```

### Apply execution plan

This will create the droplets (your DigitalOcean account will be charged).

```bash
$ terraform apply plan.tfplan
```

### Save tfstate

```bash
$ git add terraform.tfstate*
$ git commit -m "Bring up infrastructure"
```
