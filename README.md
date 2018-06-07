# Gentoo Overlay

## Installation

    sudo bash -c "cat > /etc/portage/repos.conf/rage.conf" << EOF
    [rage]
    location = /usr/local/portage/rage
    sync-type = git
    sync-uri = https://gitlab.com/lramage94/overlay.git
    priority=9999
    EOF

Afterwards, run `emerge --sync` to checkout the latest revision.
