# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit savedconfig toolchain-funcs

DESCRIPTION="transparent, simple X display locker"
HOMEPAGE="http://github.org/lramage94/tslock"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-fbsd"
IUSE="savedconfig"

DEPEND="
		x11-libs/libX11
		x11-libs/libXext
		x11-libs/libXrandr
"

RDEPEND="
		${DEPEND}
		x11-proto/randrproto
		x11-proto/xproto
"
