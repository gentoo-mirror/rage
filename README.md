# Portage - Rage Overlay

## Installation

### Script way

```sh
curl -L https://gitlab.com/oxr463/overlay/-/raw/master/.local/share/rage/bin/install.sh | sh -
```

**Note: this script requires elevated privileges in order to run.**

### Eselect way

```sh
sudo eselect repository add rage git https://gitlab.com/oxr463/overlay.git
emerge --sync rage
```

### Docker

```sh
docker-compose --project-directory . -f .local/share/rage/docker-compose.yml build
```

### Vagrant

```sh
VAGRANT_CWD=".local/share/rage" vagrant up --provision
```

## License

SPDX-License-Identifier: [GPL-2.0-or-later](https://spdx.org/licenses/GPL-2.0-or-later.html)

## Reference

- [Gentoo Overlays](https://overlays.gentoo.org)
