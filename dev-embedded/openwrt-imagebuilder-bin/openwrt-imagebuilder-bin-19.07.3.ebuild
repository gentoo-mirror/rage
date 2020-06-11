# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

_PN="openwrt-imagebuilder"
_P="${_PN}-${PV}"

DESCRIPTION="Pre-compiled environment suitable for creating custom images"
HOMEPAGE="https://openwrt.org/docs/guide-user/additional-software/imagebuilder"
SRC_URI="https://downloads.openwrt.org/releases/${PV}/targets/x86/64/${_P}-x86-64.Linux-x86_64.tar.xz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
S="${WORKDIR}/${_P}"

QA_PREBUILT="opt/${_P}/*"

src_install() {
	local OPENWRT_BUILD_HOME="/opt/${_P}"

	dodir ${OPENWRT_BUILD_HOME%/*}
	mv "${S}" "${ED%/}"${OPENWRT_BUILD_HOME} || die
}
