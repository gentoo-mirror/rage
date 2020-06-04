# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils

DESCRIPTION="NSS Module for performing user lookups against the Azure Active Directory"
HOMEPAGE="https://cyberninjas.github.io/aad-for-linux"
SRC_URI="https://github.com/cyberninjas/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

BDEPEND="
	dev-libs/libsodium
	dev-libs/jansson
	dev-libs/jwt
	dev-libs/sds
	net-misc/curl
	sys-libs/libxcrypt
"
DEPEND="${BDEPEND}"

src_prepare() {
	default
	sed -i 's|xcrypt.h|xcrypt/xcrypt.h|g' libnss_aad.c
	sed -i 's|-lxcrypt|-lcrypt|g' Makefile
}

src_install() {
	emake install PREFIX="/usr" LIB_DIR="$(get_libdir)"
	dodoc doc/*.md
}
