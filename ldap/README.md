### Copy certificates

```
scp -r ../certs/*.pem core@ldap.selfhosted.site:/home/core/
```

### Create directories

```
ssh core@ldap.selfhosted.site
mkdir -p /home/core/openldap/etc
mkdir -p /home/core/openldap/data
```

### Copy openldap.service.example

```
scp openldap.service.example core@ldap.selfhosted.site:/home/core/openldap.service
```

### Customize openldap.service

```
ssh core@ldap.selfhosted.site
vi openldap.service
```

Provide values for these variables:

* LDAP_ORGANISATION
* LDAP_DOMAIN
* LDAP_ADMIN_PASSWORD

### Load service

```
sudo systemctl daemon-reload
```

### Start service

```
sudo systemctl start openldap.service
```

### Check status

```
sudo systemctl status openldap.service
```

### Test

Connect to `ldap.selfhosted.site` from your local machine:

```
ldapsearch -x -h ldap.selfhosted.site -b dc=example,dc=com -D "cn=admin,dc=example,dc=com" -w mypassword -Z
```
