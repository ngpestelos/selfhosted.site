### Clone openshift-ansible

```
git clone https://github.com/openshift/openshift-ansible
cd openshift-ansible
git checkout release-1.4
```

### Customize inventory file

```
cp hosts.example openshift-ansible/hosts
vi hosts
```

### Run playbook

```
ansible-playbook -i hosts playbooks/byo/config.yml -vvvv
```