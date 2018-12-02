# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Android bootimg creation tool"
HOMEPAGE="https://github.com/osm0sis/mkbootimg"
SRC_URI="https://github.com/osm0sis/${PN}/archive/${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="static"

DEPEND=""
RDEPEND="${DEPEND}"

TARGET="all"
SUFFIX=""

pkg_setup() {
	if use static; then
		TARGET="static"
		SUFFIX="-${TARGET}"
	fi
}

src_prepare() {
	default
	sed 's|-s*$||g' Makefile || die
}

src_compile() {
	make "${TARGET}"
}

src_install() {
	newbin "mkbootimg${SUFFIX}" ${PN}
	newbin "unpackbootimg${SUFFIX}" unpackbootimg
}
