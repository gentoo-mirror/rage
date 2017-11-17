# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils versionator

MY_PR="first_edition"
MY_PV=$(replace_all_version_separators '_')
MY_P="${PN}_${MY_PV}_${MY_PR}"
S="${WORKDIR}/${PN}"

DESCRIPTION="a fork of Cube 2: Sauerbraten with upgraded modern rendering techniques."
HOMEPAGE="http://tesseract.gg/"
SRC_URI="http://download.tuxfamily.org/tesseract/${MY_P}_linux.tar.xz"

LICENSE="ZLIB freedist"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="sdl"

DEPEND="
	net-libs/enet:1.3
	sys-libs/zlib
	media-libs/libsdl2
	media-libs/sdl2-image
	media-libs/sdl2-mixer
	virtual/glu
	virtual/opengl
	x11-libs/libX11
"
RDEPEND="${DEPEND}"

src_compile() {
	cd "${S}"/src
	emake || die "Make failed!"
}
