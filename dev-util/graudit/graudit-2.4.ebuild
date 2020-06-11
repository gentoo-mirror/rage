# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Grep rough audit - source code auditing tool"
HOMEPAGE="https://www.justanotherhacker.com/projects/graudit.html"
SRC_URI="https://github.com/wireghoul/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DOCS=( ${PN}.1 ${PN}.7 Changelog README.md )

RDEPEND="app-shells/bash:="
DEPEND="${RDEPEND}"

src_prepare() {
	default
	rm Makefile || die "Failed to remove Makefile"
}

src_install() {
	local datadir="/usr/share/${PN}"

	dodir ${datadir%/*}
	mv "${S}/signatures" "${datadir}"
	dobin "${S}/${PN}"
}
