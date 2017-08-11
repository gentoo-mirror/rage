# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils versionator

MY_PR="first_edition"
MY_PV=$(replace_version_separator 2 '-')
MY_P="${PN}-${MY_PV}"

DESCRIPTION="a first-person shooter game focused on instagib deathmatch and capture-the-flag gameplay as well as cooperative in-game map editing."
HOMEPAGE="http://tesseract.gg/"
SRC_URI="http://download.tuxfamily.org/tesseract/${MY_P}_linux.tar.xz"

LICENSE="ZLIB freedist"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="sdl"

DEPEND="
       net-libs/enet
       sys-libs/zlib
       media-libs/libsdl2
       media-libs/sdl2-image
       media-libs/sdl2-mixer
       virtual/glu
       virtual/opengl
       x11-libs/libX11
"
RDEPEND="${DEPEND}"

# https://gitweb.gentoo.org/repo/gentoo.git/tree/games-fps/sauerbraten/sauerbraten-2013.02.03.ebuild
# https://websvn.tuxfamily.org/filedetails.php?repname=tesseract%2Fmain&path=%2Fsrc%2FMakefile
