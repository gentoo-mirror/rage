#!/bin/sh
# Provision rage overlay for testing
set -eu

OVERLAY_DIR="/var/db/repos/rage"

# Copy portage configuration
cp -R "${OVERLAY_DIR}"/.local/etc/portage/* /etc/portage/

# Set keywords
echo 'ACCEPT_KEYWORDS="~amd64"' >> /etc/portage/make.conf

emerge -nq @rage-overlay-dependencies

# Set vi as default editor
ln -s /bin/busybox /usr/local/bin/vi
eselect editor set /usr/local/bin/vi
