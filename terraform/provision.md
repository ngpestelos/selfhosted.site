Provision droplets
==================

Use [terraform](https://terraform.io) to provision droplets.

### Generate execution plan

```
terraform plan -out plan.tfplan -var "do_token=$DO_TOKEN" -var "do_ssh_key=$DO_SSH_KEY"
```

![Example](images/1.png)

### Apply execution plan

```
terraform apply plan.tfplan
```

![Example](images/2.png)
