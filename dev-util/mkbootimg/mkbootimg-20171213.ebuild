# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_REPO_URI="https://github.com/osm0sis/mkbootimg.git"
EGIT_COMMIT="015be7ed1001f60c9d621970cab71577d396f452"

inherit epatch git-r3

DESCRIPTION="Android bootimg creation tool"
HOMEPAGE="https://github.com/osm0sis/mkbootimg"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
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
	epatch "${FILESDIR}/no-strip-fix.patch"
	eapply_user
}

src_compile() {
	make "${TARGET}"
}

src_install() {
	newbin "mkbootimg${SUFFIX}" ${PN}
	newbin "unpackbootimg${SUFFIX}" unpackbootimg
}
