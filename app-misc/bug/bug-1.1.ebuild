# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Simple Bug / ToDo tracker for the command line"
HOMEPAGE="http://vicerveza.homeunix.net/~viric/soft/bug"
SRC_URI="http://vicerveza.homeunix.net/~viric/soft/${PN}/${PN}.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}"

src_prepare() {
	default
}

src_configure() {
	:
}

src_compile() {
	:
}

src_install() {
	dobin ${PN}
}

pkg_postinstall() {
	elog "The manual is in the head of the file."
}
