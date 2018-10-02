# Rage <OxR463> Overlay

[![Gentoo][gentoo-badge]][gentoo-url]

## Installation

    sudo bash -c "cat > /etc/portage/repos.conf/rage.conf" << EOF
    [rage]
    location = /usr/local/portage/rage
    sync-type = git
    sync-uri = https://gitlab.com/lramage94/overlay.git
    priority=9999
    EOF

Afterwards, run `emerge --sync` to checkout the latest revision.

[gentoo-url]: https://www.gentoo.org
[gentoo-badge]: https://www.gentoo.org/assets/img/badges/gentoo-badge2.png