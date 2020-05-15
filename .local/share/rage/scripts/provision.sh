#!/bin/sh
# Provision rage overlay for testing
set -eu

# Set keywords
cat << EOF > /etc/portage/package.accept_keywords
sys-apps/pkgcore ~amd64
dev-util/pkgcheck ~amd64
EOF

# Unmask dependencies
cat << EOF > /etc/portage/package.unmask
<sys-devel/gcc-5.4
<sys-libs/glibc-2.30-r8
<sys-devel/binutils-2.33.1-r1
<sys-libs/binutils-libs-2.33.1-r1
EOF

# Create dependency set
mkdir -p /etc/portage/sets

cat << EOF > /etc/portage/sets/rage-overlay
# test dependencies for rage overlay
app-portage/repoman
dev-util/pkgcheck
dev-vcs/git
net-fs/sshfs
EOF

emerge -nq --backtrack=1000 @rage-overlay

# Set vi as default editor
ln -s /bin/busybox /usr/local/bin/vi
eselect editor set /usr/local/bin/vi

