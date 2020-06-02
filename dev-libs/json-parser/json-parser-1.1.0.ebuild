# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils toolchain-funcs

DESCRIPTION="Very low footprint JSON parser written in portable ANSI C"
HOMEPAGE="https://github.com/udp/json-parser"
SRC_URI="https://github.com/udp/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="static-libs"

src_install() {
	if use static-libs ; then
		emake prefix="${EPREFIX}/usr" DESTDIR="${D}" install
	else
		emake prefix="${EPREFIX}/usr" DESTDIR="${D}" install-shared
	fi
}
