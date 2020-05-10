#!/bin/sh
# Provision rage overlay for Vagrant
set -eu

mkdir -p /etc/portage/sets

cat << EOF > /etc/portage/sets/rage-vagrant
# vagrant dependencies for rage overlay
dev-vcs/git
net-fs/sshfs
EOF

emerge -nq @rage-vagrant

