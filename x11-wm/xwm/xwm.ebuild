# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit savedconfig toolchain-funcs

DESCRIPTION="eXtended Window Manager is based on dwm-plus which is a highly modified fork of dwm."
HOMEPAGE="http://github.com/lramage94/xwm"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-fbsd"
IUSE="xinerama"

DEPEND="
		media-libs/fontconfig
		media-fonts/terminus-font
		x11-libs/libX11
		x11-libs/libXft
		xinerama? ( x11-libs/libXinerama )
"

RDEPEND="${DEPEND}"
