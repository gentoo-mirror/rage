# Rage <oxr463> Overlay

## Installation

```sh
curl -L https://gitlab.com/oxr463/overlay/-/raw/master/.local/share/rage/bin/install.sh | sh -
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

## License

SPDX-License-Identifier: [GPL-2.0-or-later](https://spdx.org/licenses/GPL-2.0-or-later.html)

## Reference

- [Gentoo Overlays](https://overlays.gentoo.org)
