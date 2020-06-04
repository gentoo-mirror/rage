# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils pam

DESCRIPTION="Azure Active Directory PAM Module"
HOMEPAGE="https://cyberninjas.github.io/aad-for-linux"
SRC_URI="https://github.com/cyberninjas/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-libs/jansson
	dev-libs/jwt
	dev-libs/sds
	net-misc/curl
"
DEPEND="${RDEPEND}"

src_prepare() {
	default
	sh ./bootstrap.sh || die "Failed to bootstrap configure files"
}

src_configure() {
	econf --with-pam-dir=$(getpam_mod_dir)
}

src_install() {
	default
	dodoc doc/*.md
}
