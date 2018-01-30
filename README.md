# Gentoo Overlay [![Build Status](https://travis-ci.org/lramage94/overlay.svg?branch=master)](https://travis-ci.org/lramage94/overlay)

## Installation

    sudo bash -c "cat > /etc/portage/repos.conf/rage.conf" << EOF
    [rage]
    location = /usr/local/portage/rage
    sync-type = git
    sync-uri = https://github.com/lramage94/overlay.git
    priority=9999
    EOF

Afterwards, run `emerge --sync` to checkout the latest revision.
