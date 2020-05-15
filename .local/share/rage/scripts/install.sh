#!/bin/sh
# Configure rage overlay for Portage
set -eu

OVERLAY_DIR="/var/db/repos/rage"
OVERLAY_CONFIG="/etc/portage/repos.conf/rage.conf"

mkdir -p /etc/portage/repos.conf
mkdir -p "${OVERLAY_DIR}"

cat > "${OVERLAY_CONFIG}" << EOF
[rage]
location = ${OVERLAY_DIR}
sync-type = git
sync-uri = https://gitlab.com/oxr463/overlay.git
priority=9999
EOF

emerge --sync rage

