# Rage <OxR463> Overlay

## Installation

```sh
curl -L https://gitlab.com/oxr463/overlay/-/raw/master/.local/share/rage/scripts/install.sh | sh -
```

**Note: this script requires elevated privileges in order to run.**

### Docker

```sh
docker build -f .local/share/rage/Dockerfile -t oxr463/overlay .
```

### Vagrant

```sh
VAGRANT_CWD=".local/share/rage" vagrant up --provision
```

