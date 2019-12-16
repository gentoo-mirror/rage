# Rage <OxR463> Overlay

## Installation

    sudo bash -c "cat > /etc/portage/repos.conf/rage.conf" << EOF
    [rage]
    location = /var/db/repos/rage
    sync-type = git
    sync-uri = https://gitlab.com/oxr463/overlay.git
    priority=9999
    EOF

Afterwards, run `emerge --sync` to checkout the latest revision.
