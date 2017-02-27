Destroy droplets
================

Use [terraform](https://terraform.io) to destroy droplets.

### Generate execution plan

```
terraform plan -destroy -out plan.tfplan -var "do_token=$DO_TOKEN" -var "do_ssh_key=$DO_SSH_KEY"
```

### Apply execution plan

```
terraform apply plan.tfplan
```