# Vault in a Docker Container

Vault by HashiCorp in a Docker Container using Alpine Linux as the OS.

## Install

docker pull minionscloud/vault:latest

## Getting Started
* Pull the image
* Choose how you want to run the image (in Dev Mode or with a Configuration and Backend)
* Run the image

### To run in Dev Mode

```
docker run -d -p 8200 minionscloud/vault:latest
```

### To run with a Configuration and Backend

Create your configuration in a volume (or straight on your host) following the documentation at https://www.vaultproject.io/docs/config/index.html

Then, assuming your configuration file was in /etc/vault-config/, run the following command

```
docker run -d -p 8200 --cap-add IPC_LOCK -v /etc/vault-config/:/config  minionscloud/vault:latest vault server -config=/config
```

IMPORTANT: Don't forget to add the --cap-add IPC_LOCK in order to allow Vault to lock the secrets in memory and avoid swapping them to disk