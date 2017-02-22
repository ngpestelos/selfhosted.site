DigitalOcean
============

You will need an [API token](https://www.digitalocean.com/community/tutorials/how-to-use-the-digitalocean-api-v2) and a SSH fingerprint in order to provision droplets.

### SSH Fingerprint

The SSH fingerprint will be used by DigitalOcean to grant remote access to the provisioned droplets.

```
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" "https://api.digitalocean.com/v2/account/keys"
```
