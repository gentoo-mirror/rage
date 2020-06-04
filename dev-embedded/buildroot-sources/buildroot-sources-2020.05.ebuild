# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

_PN="buildroot"
_P="${_PN}-${PV}"

DESCRIPTION="Easy-to-use tool to generate embedded Linux systems through cross-compilation"
HOMEPAGE="https://www.buildroot.org"
SRC_URI="https://www.buildroot.org/downloads/${_P}.tar.bz2"
LICENSE="GPL-3+"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
S="${WORKDIR}/${_P}"

src_prepare() { :; }

src_compile() { :; }

src_install() {
	local SRC_DIR="/usr/src/${_P}"

	dodir ${SRC_DIR%/*}
	mv "${S}" "${ED%/}"${SRC_DIR} || die
}
