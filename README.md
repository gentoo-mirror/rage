# Gentoo Overlay [![Build Status](https://travis-ci.org/lramage94/gentoo-overlay.svg?branch=master)](https://travis-ci.org/lramage94/gentoo-overlay)
This is my personal overlay used for development and therefore is UNSTABLE. Use at your own risk.

## Installation

[Local overlays](https://wiki.gentoo.org/wiki/Custom_repository) should be managed via `/etc/portage/repos.conf/`.
To enable this overlay make sure you are using a recent Portage version (at least `2.2.14`), and create a `/etc/portage/repos.conf/rage-overlay.conf` file containing precisely:

```
[rage-overlay]
location = /usr/local/portage/rage-overlay
sync-type = git
sync-uri = https://github.com/lramage94/gentoo-overlay.git
priority=9999
```

Afterwards, simply run `emerge --sync`, and Portage should seamlessly make all our ebuilds available.

After performing those steps, the following should work (or any other package from this overlay):

## Reference
- [Gentoo Overlays](https://overlays.gentoo.org/)
- [Gentoo Wiki: Custom Tree](https://wiki.gentoo.org/wiki/Handbook:AMD64/Portage/CustomTree)
- [Gentoo Wiki: Custom Repository](https://wiki.gentoo.org/wiki/Custom_repository)
- [Gentoo Wiki: Writing Ebuilds](https://wiki.gentoo.org/wiki/Basic_guide_to_write_Gentoo_Ebuilds)
